#' floor actions methods
#'
#' @export
#' @name floor_actions
#' @param congress (character) The number of the Congress this update
#' took place during.
#' @param chamber (character) The chamber this update took place in. 'house'
#' or 'senate'.
#' @param year (integer) year of the form YYYY
#' @param month (integer) month of the form MM
#' @param day (integer) day of the form DD
#' @param key your ProPublica API key; pass in or loads from environment variable
#' stored as `PROPUBLICA_API_KEY` in either your .Renviron, or similar file
#' locatd in your home directory
#' @param as (character) IGNORED FOR NOW
#' @param ... optional curl options passed on to [crul::HttpClient].
#' See [curl::curl_options()]
#' @return various things for now, since return objects vary quite a bit
#' among the different votes routes
#' @examples \dontrun{
#' cg_floor_actions_recent(115, "house")
#' cg_floor_actions_date("senate", 2017, 5, 2)
#' }
cg_floor_actions_recent <- function(congress, chamber, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/%s/floor_updates.json", congress, chamber)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname floor_actions
cg_floor_actions_date <- function(chamber, year, month, day,
  key = NULL, as = 'table', ...) {

  path <- sprintf("congress/v1/%s/floor_updates/%s/%s/%s.json",
    chamber, year, sprintf("%02d", month), sprintf("%02d", day))
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}
