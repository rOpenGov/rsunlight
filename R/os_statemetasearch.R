#' Search OpenStates metadata.
#'
#' @import httr
#' @importFrom plyr compact
#' @param state state two-letter abbreviation (character)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_statemetasearch('ca')
#' }
os_statemetasearch <- function(state = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
{
  if(is.null(state))
    stop("state must specify a two letter state abbreviation")
  url = "http://openstates.org/api/v1/metadata/"
  url_ <- paste(url, state, "/?apikey=", key, sep= "")
  tt <- GET(url_)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  class(res) <- "os_statemetasearch"
  return( res )
}
