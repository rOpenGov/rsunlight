#' Write data to a csv file on your machine.
#' 
#' @import assertthat
#' @param x Output from any of the rsunlight functions.
#' @param file File name, with path.
#' @param ... Further args passed to read.csv
#' @examples \dontrun{
#' out <- cg_getcommittees(id = 'JSPR')
#' sunlight_tocsv.cg_getcommittees(out, "~/myfile.csv")
#' 
#' out <- cg_getcommitteesallleg(bioguide_id = 'S000148')
#' sunlight_tocsv.cg_getcommitteesallleg(out, "~/myfile.csv")
#' }
sunlight_tocsv <- function(x, file="~/", ...){
  UseMethod("sunlight_tocsv")
}

sunlight_tocsv.cg_getcommittees <- function(x, file="~/", ...){
  assert_that(is(x, "cg_getcommittees"))
  notmembers <- x$committee[!names(x$committee) %in% "members"]
  notmembers <- replacemissing(notmembers)
  members <- do.call(rbind.fill, lapply(x$committee$members, data.frame, stringsAsFactors = FALSE))
  dat <- cbind(notmembers, members)
  write.csv(dat, file=file, ...) 
}

sunlight_tocsv.cg_getcommitteesallleg <- function(x, file="~/", ...){
  assert_that(is(x, "cg_getcommitteesallleg"))
  dat <- lapply(x$committees, function(b){
    df <- do.call(rbind.fill, lapply(b$committee$subcommittees, data.frame, stringsAsFactors = FALSE))
    tmp <- b$committee[!names(b$committee) %in% "subcommittees"]
    tmp <- replacemissing(tmp)
    tmp <- data.frame(tmp, stringsAsFactors = FALSE)
    names(tmp) <- c('committee_chamber','committee_id','committee_name')
    if(!is.null(df)){
      names(df) <- c('subcommittee_chamber','subcommittee_id','subcommittee_name')
      cbind(tmp, df)
    } else{ tmp }
  })
  dat2 <- do.call(rbind.fill, dat)
  write.csv(dat2, file=file, ...) 
}

replacemissing <- function(x){
  lapply(x, function(y){
    ifelse(length(y)==0, "", y)
  })
}