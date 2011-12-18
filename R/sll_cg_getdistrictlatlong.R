#' Get districts for a latitude/longitude.
#' @import RJSONIO RCurl
#' @param latitude latitude of coordinate
#' @param longitude longitude of coordinate
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_getdistrictlatlong(latitude = 35.778788, longitude = -78.787805)
#' }
sll_cg_getdistrictlatlong <- 

function(latitude = NA, longitude = NA,
    url = "http://services.sunlightlabs.com/api/districts.getDistrictFromLatLong.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(latitude))
    args$latitude <- latitude
  if(!is.na(longitude))
    args$longitude <- longitude
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}