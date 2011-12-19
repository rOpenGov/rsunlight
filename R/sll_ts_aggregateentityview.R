#' Look up the entity ID based on an ID from a different data set. Currently 
#'    they provide a mapping from the ID schemes used by Center for Reponsive 
#'    Politics (CRP) and the National Institute for Money in State Politics (NIMSP).
#' @import RJSONIO RCurl
#' @param id The ID of the entity in the given namespace.
#' @param cycle Return contribution totals for the given cycle. When not given, 
#'    returns totals for all cycles.
#' @param url the Sunlight Labs API url for the function
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return a JSON object listing the TransparencyData IDs matching the 
#'    given external ID.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregateentityview(id = '85ab2e74589a414495d18cc7a9233981')
#' }
sll_ts_aggregateentityview <- 

function(id = NA, cycle = NA,
    url = "http://transparencydata.com/api/1.0/entities/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, id, '.json', sep='')
  args <- list(apikey = key)
  if(!is.na(cycle))
    args$cycle <- cycle
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}
# http://transparencydata.com/api/1.0/entities/ff96aa62d48f48e5a1e284efe74a0ba8.json?apikey=<your-key>