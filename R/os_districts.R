#' Search OpenStates districts
#'
#' @export
#' @param state state two-letter abbreviation (character). required
#' @param chamber Whether this district belongs to the upper or
#' lower chamber. (character)
#' @param abbr State abbreviation. (character)
#' @param boundary_id boundary_id used in District Boundary Lookup (character)
#' @param id A unique ID for this district (separate from boundary_id).
#' @param legislators List of legislators that serve in this district. (may be
#' more than one if num_seats > 1)
#' @param name Name of the district (e.g. '14', '33A', 'Fifth Suffolk')
#' @param num_seats Number of legislators that are elected to this seat.
#' Generally one, but will be 2 or more if the seat is a multi-member district.
#' @param as (character) One of table (default), list, or response
#' (`crul` response object)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Curl options passed on to [crul::HttpClient]
#' @return a data.frame of bills.
#' @details this route appears to not support pagination, sorting or
#' selecting fields
#' @examples \dontrun{
#' os_districts(state = 'tx')
#' os_districts(state = 'tx', chamber = 'upper')
#' os_districts(state = 'dc')
#' os_districts(state = 'dc', per_page=3)
#' os_districts(state = 'dc', per_page=3, sort='created_at')
#' }
os_districts <- function(state, chamber = NULL, abbr = NULL, boundary_id = NULL,
  id = NULL, legislators=NULL, name=NULL, num_seats=NULL,
  as ='table', key = NULL, ...) {

  key <- check_key(key, 'OPEN_STATES_KEY')
  args <- sc(list(abbr = abbr,
    boundary_id = boundary_id, id = id, legislators=legislators,
    name=name, num_seats=num_seats))
  path <- file.path("districts", state)
  if (!is.null(chamber)) path <- file.path(path, chamber)
  give(as, osurl(), path, args, key, ...)
}
