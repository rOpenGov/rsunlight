#' Get list of all committees for a given chamber along with their subcommittees.
#' @import RJSONIO RCurl
#' @param chamber House, Senate, or Joint
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return List of all committees in the specified chamber with their
#'    subcommittees (but not memberships due to size of response).
#' @export
#' @examples \dontrun{
#' sll_cg_getcommitteeslist(chamber = 'Joint')
#' }
sll_cg_getcommitteeslist <- 

function(chamber = NA,
    url = "http://services.sunlightlabs.com/api/committees.getList.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(chamber))
    args$chamber <- chamber
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}