#' committees methods
#'
#' @export
#' @name committees
#' @param congress (character) The number of the Congress this update
#' took place during.
#' @param chamber (character) The chamber this update took place in. 'house'
#' or 'senate'.
#' @param id (character) a commmitte id
#' @param sub_id (character) a sub-committee id
#' @param date (character) a date, of the form YYYY-MM-DD
#' @param category (character) one of ec, pm, or pom
#' @param key your ProPublica API key; pass in or loads from environment variable
#' stored as `PROPUBLICA_API_KEY` in either your .Renviron, or similar file
#' locatd in your home directory
#' @param as (character) IGNORED FOR NOW
#' @param ... optional curl options passed on to [crul::HttpClient].
#' See [curl::curl_options()]
#' @return various things for now, since return objects vary quite a bit
#' among the different votes routes
#' @examples \dontrun{
#' cg_committees(115, "senate")
#' cg_committee(115, "senate", "SSAF")
#' cg_committee(115, "senate", "HSAS", sub_id = "HSAS28")
#' cg_committee_hearings(115)
#' cg_committee_hearings(115, "house", "HSRU")
#' cg_committee_comms(115)
#' cg_committees_comms_category(115, "pm")
#' cg_committees_comms_date("2018-03-21")
#' cg_committees_comms_chamber(115, "house")
#' }
cg_committees <- function(congress, chamber, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/%s/committees.json", congress, chamber)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committee <- function(congress, chamber, id, sub_id = NULL, key = NULL,
  as = 'table', ...) {

  if (!is.null(sub_id)) {
    path <- sprintf("congress/v1/%s/%s/committees/%s/subcommittees/%s.json",
      congress, chamber, id, sub_id)
  } else {
    path <- sprintf("congress/v1/%s/%s/committees/%s.json",
      congress, chamber, id)
  }
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committee_hearings <- function(congress, chamber = NULL, id = NULL,
  key = NULL, as = 'table', ...) {

  if (!is.null(chamber) && !is.null(id)) {
    path <- sprintf("congress/v1/%s/%s/committees/%s/hearings.json",
      congress, chamber, id)
  } else {
    path <- sprintf("congress/v1/%s/committees/hearings.json", congress)
  }
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committee_comms <- function(congress, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/communications.json", congress)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committees_comms_category <- function(congress, category, key = NULL,
  as = 'table', ...) {

  path <- sprintf("congress/v1/%s/communications/category/%s.json", congress, category)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committees_comms_date <- function(date, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/communications/date/%s.json", date)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname committees
cg_committees_comms_chamber <- function(congress, chamber, key = NULL,
  as = 'table', ...) {

  path <- sprintf("congress/v1/%s/communications/%s.json", congress, chamber)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}
