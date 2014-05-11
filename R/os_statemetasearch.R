#' Search OpenStates metadata.
#'
#' @import httr
#' @importFrom plyr compact
#' @param state One or more two-letter state abbreviations (character)
#' @param key your SunlightLabs API key; or loads from .Rprofile
#' @param callopts Curl options passed on to httr::GET
#' @return A list with metadata for each state.
#' @export
#' @examples \dontrun{
#' os_statemetasearch()
#' os_statemetasearch('ca')
#' os_statemetasearch('tx')
#' out <- os_statemetasearch(c('tx','nv'))
#' out$tx
#' out$nv
#' os_statemetasearch('tx', verbose())
#' }
os_statemetasearch <- function(state = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), callopts=list())
{
  getdata <- function(x=NULL){
    url = "http://openstates.org/api/v1/metadata/"
    if(!is.null(x))
      url <- paste(url, x, sep= "")
    url2 <- paste(url, "?apikey=", key, sep= "")
    tt <- GET(url2, callopts)
    stop_for_status(tt)
    out <- content(tt, as = "text")
    fromJSON(out, simplifyVector = FALSE)
  }
  if(!is.null(state)){
    res <- lapply(state, getdata)
    names(res) <- state
  } else { res <- getdata() }

  class(res) <- "os_statemetasearch"
  return( res )
}
