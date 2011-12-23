#' Search OpenStates metadata.
#' @import RJSONIO RCurl
#' @param state state two-letter abbreviation (character)
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_statemetasearch('ca')
#' }
sll_os_statemetasearch <- 

function(state, url = "http://openstates.org/api/v1/metadata/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs"))) 
{
  url_ <- paste(url, state, "/?apikey=", key, sep= "")
  fromJSON(url_)
}