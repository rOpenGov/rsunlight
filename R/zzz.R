sc <- function(x){
  Filter(Negate(is.null), x)
}

return_obj <- function(x, y){
  y <- err_hand(y)
  x <- match.arg(x, c('response', 'list', 'table', 'data.frame'))
  if (x == 'response') {
    y
  } else {
    if (x == 'list') {
      tibble::as_tibble(jsonlite::fromJSON(y, simplifyVector = FALSE,
        flatten = TRUE))
    } else {
      tibble::as_tibble(jsonlite::fromJSON(y, flatten = TRUE))
    }
  }
}

return_obj_notibbles <- function(x, y){
  y <- err_hand(y)
  x <- match.arg(x, c('response', 'list', 'table', 'data.frame'))
  if (x == 'response') {
    y
  } else {
    if (x == 'list') {
      jsonlite::fromJSON(y, simplifyVector = FALSE,
        flatten = TRUE)
    } else {
      jsonlite::fromJSON(y, flatten = TRUE)
    }
  }
}

flatten_df <- function(x) {
  if (NROW(x) == 0) {
    x
  }
  else {
    for (i in seq_len(NCOL(x))) {
      if (class(x[,i][[1L]]) == "list") {
        z <- unlist(x[,i])
        if (length(z) != NROW(x)) z <- rep(NA_character_, NROW(x))
        x[,i] <- z
      }
    }
    x
  }
}

# check if stupid single left bracket returned
err_hand <- function(z) z$parse("UTF-8")

give_noiter <- function(as, url, endpt, args, ...) {
  tmp <- return_obj(as, query(url, endpt, args, NULL, ...))
  switch(as,
         table = as_data_frame(flatten_df(tmp)),
         list = tmp,
         response = tmp)
}

give <- function(as, url, endpt, args, key, ...) {
  iter <- get_iter(args)
  if (length(iter) == 0) {
    out <- query(url = osurl(), path = sprintf("api/v1/%s/", endpt), args,
      headers = list(`X-API-KEY` = key), ...)
    tmp <- return_obj(as, out)
  } else {
    tmp <- lapply(iter[[1]], function(w) {
      args[[ names(iter) ]] <- w
      out <- query(url = osurl(), path = sprintf("api/v1/%s/", endpt), args,
        headers = list(`X-API-KEY` = key), ...)
      return_obj(as, out)
    })
    if (as == "table") {
      tmp <- tmp[vapply(tmp, length, numeric(1)) != 0]
      tmp <- plyr::rbind.fill(tmp)
    }
  }
  switch(as,
         table = as_data_frame(flatten_df(tmp)),
         list = tmp,
         response = tmp)
}

give_cg <- function(as, url, endpt, args, ...) {
  key <- check_key(NULL, "PROPUBLICA_API_KEY")
  iter <- get_iter(args)
  if (length(iter) == 0) {
    tmp <- return_obj(as, query(file.path(url, endpt), args,
      headers = list(`X-API-KEY` = key), ...))
    found <- tmp$results$num_results
  } else {
    tmp <- lapply(iter[[1]], function(w) {
      args[[ names(iter) ]] <- w
      return_obj(as, query(paste0(url, endpt), args,
        headers = list(`X-API-KEY` = key), ...))
    })
    found <- as.list(stats::setNames(sapply(tmp, function(z) {
      zz <- z$num_found
      if (is.null(zz)) z$count
    }), iter[[1]]))
    if (as == "table") {
      res <- lapply(tmp, "[[", "results")
      res <- Filter(function(x) !(is.null(x) || length(x) == 0), res)
      for (i in seq_along(res)) {
        res[[i]][names(iter)] <- iter[[1]][i]
      }
      res <- res[vapply(res, length, numeric(1)) != 0]
      tmp <- rbind.fill(res)
    }
  }
  structure(switch(as,
         table = if (length(iter) == 0) {
           as_data_frame(flatten_df(tmp$results))
         } else {
           as_data_frame(flatten_df(tmp))
         },
         list = tmp,
         response = tmp), found = found)
}

one_vec <- function(x) {
  lens <- x[vapply(x, length, 1) > 1]
  if (length(lens) > 1) {
    stop("Only one parameter can be vectorized per function call", call. = FALSE)
  }
}

get_iter <- function(z) {
  z[vapply(z, length, 1) > 1]
}

check_key <- function(x, name){
  tmp <- if (is.null(x)) Sys.getenv(name, "") else  x
  if (tmp == "") stop("need an API key for Sunlight Labs") else tmp
}

cgurl <- function() 'https://api.propublica.org'
ieurl <- function() 'http://transparencydata.com/api/1.0'
osurl <- function() 'https://openstates.org'
rtieurl <- function() "http://realtime.influenceexplorer.com/api/"

as_dt <- function(z) {
  (data.table::setDF(
    data.table::rbindlist(z, fill = TRUE, use.names = TRUE)
  ))
}

foo_bar <- function(as, url, path, args, key, parse = FALSE, ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  tmp <- query(url, path, args,
    headers = list(`X-API-KEY` = key), ...)
  tmp <- err_hand(tmp)
  jsonlite::fromJSON(tmp, parse)
}
