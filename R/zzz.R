suncompact <- function(x){
  Filter(Negate(is.null), x)
}

return_obj <- function(x, y){
  x <- match.arg(x, c('response', 'list', 'table', 'data.frame'))
  if (x == 'response') {
    y
  } else {
    out <- content(y, as = "text")
    if (x == 'list') {
      fromJSON(out, simplifyVector = FALSE, flatten = TRUE)
    } else {
      fromJSON(out)
    }
  }
}

give <- function(args, as, url, endpt, ...) {
  iter <- get_iter(args)
  if (length(iter) == 0) {
    tmp <- return_obj(as, query(paste0(url, endpt), args, ...))
  } else {
    tmp <- lapply(iter[[1]], function(w) {
      args[[ names(iter) ]] <- w
      return_obj(as, query(paste0(url, endpt), args, ...))
    })
    if (as == "table") {
      tmp <- rbind.fill(tmp)
    }
  }
  switch(as,
         table = structure(tmp, class = c("sunlight", "data.frame")),
         list = tmp,
         response = tmp)
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

#' @export
print.sunlight <- function(x, ..., n = 10){
  cat("<Sunlight data>", sep = "\n")
  cat(sprintf("   Dimensions:   [%s X %s]\n", NROW(x), NCOL(x)), sep = "\n")
  trunc_mat(x, n = n)
}

cgurl <- function() 'https://congress.api.sunlightfoundation.com'
cwurl <- function() 'http://capitolwords.org/api'
ieurl <- function() 'http://transparencydata.com/api/1.0'
osurl <- function() 'http://openstates.org/api/v1'
