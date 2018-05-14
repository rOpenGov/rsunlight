#' Get OpenStates districts boundary by boundary id
#'
#' @export
#' @param id a boundary id used in District Boundary Lookup (character)
#' @param as (character) One of table (default), list, or response
#' (crul response object)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Curl options passed on to [crul::HttpClient]
#' @return a data.frame of bills.
#' @examples \dontrun{
#' os_district(id = 'ocd-division/country:us/state:tx/sldl:100')
#' }
os_district <- function(id, as ='table', key = NULL, ...) {
  key <- check_key(key, 'OPEN_STATES_KEY')
  out <- query(url = osurl(),
    path = file.path("api/v1/districts/boundary", id), list(),
    headers = list(`X-API-KEY` = key), ...)
  return_obj_notibbles(as, out)
}
