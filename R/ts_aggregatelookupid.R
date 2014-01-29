#' Look up the entity ID based on an ID from a different data set. Currently 
#'    they provide a mapping from the ID schemes used by Center for Reponsive 
#'    Politics (CRP) and the National Institute for Money in State Politics (NIMSP).
#'
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param namespace The dataset and data type of the ID. Currently allowed values are:
#'    urn:crp:individual (A CRP ID for an individual contributor or lobbyist. Begins with U or C.)
#'    urn:crp:organization (A CRP ID for an organization. Begins with D.)
#'    urn:crp:recipient (A CRP ID for a politician. Begins with N.)
#'    urn:nimsp:organization (A NIMSP ID for an organization. Integer-valued.)
#'    urn:nimsp:recipient (A NIMSP ID for a politician. Integer-valued.)
#' @param id The ID of the entity in the given namespace.
#' @return a JSON object listing the TransparencyData IDs matching the 
#'    given external ID.
#' @export
#' @examples \dontrun{
#' ts_aggregatelookupid(namespace = 'urn:crp:recipient', id = 'N00007360')
#' }
ts_aggregatelookupid <- function(namespace = NULL, id = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://transparencydata.com/api/1.0/entities/id_lookup.json"
  args <- list(apikey = key, id = id, namespace = namespace)
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  content(tt)[[1]]
}