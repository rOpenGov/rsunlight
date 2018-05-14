#' Lookup Legislators geospatially
#'
#' @param lat a latitude value (numeric,integer)
#' @param long a longitude value (numeric,integer)
#' @param as (character) One of table (default), list, or response
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Curl options passed on to [crul::HttpClient]
#' @return various, depending on \code{as} parameter
#' @export
#' @examples \dontrun{
#' os_legislatorgeo(lat = 35.79, long = -78.78)
#' }
os_legislatorgeo <- function(lat, long, as = 'table', key = NULL, ...) {
  key <- check_key(key, 'OPEN_STATES_KEY')
  args <- sc(list(lat = lat, long = long))
  out <- query(url = osurl(),
  	path = "api/v1/legislators/geo/", args = args,
    headers = list(`X-API-KEY` = key), ...)
	return_obj(as, out)
}
