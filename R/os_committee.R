#' Lookup a Committee by ID
#'
#' @param id committee id (character)
#' @param as (character) One of table (default), list, or response
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Curl options passed on to [crul::HttpClient]
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_committee(id = 'TXC000103')
#' }
os_committee <- function(id, as = 'table', key = NULL, ...) {
  key <- check_key(key, 'OPEN_STATES_KEY')
  out <- query(url = osurl(),
  	path = file.path("api/v1/committees/", id), list(),
    headers = list(`X-API-KEY` = key), ...)
	return_obj_notibbles(as, out)
}
