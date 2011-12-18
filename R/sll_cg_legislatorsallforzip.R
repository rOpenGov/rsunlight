#' Search congress people and senate members for a zip code.
#' @import RJSONIO RCurl
#' @param zip zip code to search
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_legislatorsallforzip(zip = 77006)
#' }
sll_cg_legislatorsallforzip <- 

function(zip=NA,
    url = "http://services.sunlightlabs.com/api/legislators.allForZip.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(zip))
    args$zip <- zip
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}