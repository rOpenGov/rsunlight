#' Gets details (subcommittees + membership) for a committee by id.
#' @import RJSONIO RCurl
#' @param id committee id (eg. JSPR)
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return Committee details including subcommittees and all members.
#' @export
#' @examples \dontrun{
#' sll_cg_getcommittees(id = 'JSPR')
#' }
sll_cg_getcommittees <- 

function(id = NA,
    url = "http://services.sunlightlabs.com/api/committees.get.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(id))
    args$id <- id
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}