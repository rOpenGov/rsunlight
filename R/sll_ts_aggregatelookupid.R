#' Look up the entity ID based on an ID from a different data set. Currently 
#'    they provide a mapping from the ID schemes used by Center for Reponsive 
#'    Politics (CRP) and the National Institute for Money in State Politics (NIMSP).
#' @import RJSONIO RCurl
#' @param namespace The dataset and data type of the ID. Currently allowed values are:
#'    urn:crp:individual (A CRP ID for an individual contributor or lobbyist. Begins with U or C.)
#'    urn:crp:organization (A CRP ID for an organization. Begins with D.)
#'    urn:crp:recipient (A CRP ID for a politician. Begins with N.)
#'    urn:nimsp:organization (A NIMSP ID for an organization. Integer-valued.)
#'    urn:nimsp:recipient (A NIMSP ID for a politician. Integer-valued.)
#' @param id The ID of the entity in the given namespace.
#' @param url the Sunlight Labs API url for the function
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return a JSON object listing the TransparencyData IDs matching the 
#'    given external ID.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregatelookupid(namespace = 'urn:crp:recipient', id = 'N00007360')
#' }
sll_ts_aggregatelookupid <- 

function(namespace = NA, id = NA,
    url = "http://transparencydata.com/api/1.0/entities/id_lookup.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(namespace))
    args$namespace <- namespace
  if(!is.na(id))
    args$id <- id
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}