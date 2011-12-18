#' Search congress people and senate members.
#' @import RJSONIO RCurl
#' @param name name to search for
#' @param threshold optional threshold parameter specifying minimum score to 
#'    return (defaults to 0.8, lower values not recommended)
#' @param all_legislators optional parameter to search all legislators in API, 
#'    not just those currently in office (false by default)
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_getlegislatorsearch(name = 'Reed')
#' }
sll_cg_getlegislatorsearch <- 

function(name=NA, threshold=NA, all_legislators=NA,
    url = "http://services.sunlightlabs.com/api/legislators.search.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(name))
    args$name <- name
  if(!is.na(threshold))
    args$threshold <- threshold
  if(!is.na(all_legislators))
    args$all_legislators <- all_legislators
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}