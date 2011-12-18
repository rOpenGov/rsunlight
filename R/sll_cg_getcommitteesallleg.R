#' Gets a list of all committees that a member serves on, including subcommittes.
#' @import RJSONIO RCurl
#' @param bioguide_id legislator's bioguide_id
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return Committee details for all committees that the given member serves on.
#' @export
#' @examples \dontrun{
#' sll_cg_getcommitteesallleg(bioguide_id = 'S000148')
#' }
sll_cg_getcommitteesallleg <- 

function(bioguide_id = NA,
    url = "http://services.sunlightlabs.com/api/committees.allForLegislator.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(bioguide_id))
    args$bioguide_id <- bioguide_id
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}