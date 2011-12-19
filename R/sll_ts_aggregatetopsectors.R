#' Return the top contributoring organizations, ranked by total dollars given. 
#'    An organization's giving is broken down into money given directly (by 
#'    the organization's PAC) versus money given by individuals employed by 
#'    or associated with the organization.
#' @import RJSONIO RCurl
#' @param id The ID of the entity in the given namespace.
#' @param url the Sunlight Labs API url for the function
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return The top contributoring organizations, ranked by total dollars given.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregatetopsectors(id = '85ab2e74589a414495d18cc7a9233981')
#' }
sll_ts_aggregatetopsectors <- 

function(id = NA,
    url = "http://transparencydata.com/api/1.0/aggregates/pol/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, id, '/contributors/sectors.json', sep='')
  args <- list(apikey = key)
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}
# http://transparencydata.com/api/1.0/aggregates/pol/ff96aa62d48f48e5a1e284efe74a0ba8/contributors/sectors.json?apikey=<your-key>