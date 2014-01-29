#' Search OpenStates metadata.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param state state two-letter abbreviation (character)
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
  content(GET(url_))
}