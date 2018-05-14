#' statements methods
#'
#' @export
#' @name statements
#' @param query (character) a search term
#' @param date (character) a date, of the form YYYY-MM-DD
#' @param subject (character) slug version of subject
#' @param congress (character) The number of the Congress this update
#' took place during.
#' @param member_id (character) The ID of the member to retrieve; it is
#' assigned by the Biographical Directory of the United States Congress
#' (http://bioguide.congress.gov/biosearch/biosearch.asp) or can be retrieved
#' from a [cg_members()] request
#' @param key your ProPublica API key; pass in or loads from environment variable
#' stored as `PROPUBLICA_API_KEY` in either your .Renviron, or similar file
#' locatd in your home directory
#' @param as (character) IGNORED FOR NOW
#' @param ... optional curl options passed on to [crul::HttpClient].
#' See [curl::curl_options()]
#' @return various things for now, since return objects vary quite a bit
#' among the different votes routes
#' @examples \dontrun{
#' cg_statements_recent()
#' cg_statements_subjects()
#' cg_statements_search("AHCA")
#' cg_statements_date("2017-01-03")
#' cg_statements_subject('immigration')
#' cg_statements_member('C001084', 115)
#' }
cg_statements_search <- function(query, key = NULL, as = 'table', ...) {
  path <- "congress/v1/statements/search.json"
  foo_bar(as, cgurl(), path, args = list(query = query), key, ...)$results
}

#' @export
#' @rdname statements
cg_statements_recent <- function(key = NULL, as = 'table', ...) {
  path <- "congress/v1/statements/latest.json"
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname statements
cg_statements_subjects <- function(key = NULL, as = 'table', ...) {
  path <- "congress/v1/statements/subjects.json"
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname statements
cg_statements_date <- function(date, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/statements/date/%s.json", date)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname statements
cg_statements_subject <- function(subject, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/statements/subject/%s.json", subject)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname statements
cg_statements_member <- function(member_id, congress, key = NULL,
  as = 'table', ...) {

  path <- sprintf("congress/v1/members/%s/statements/%s.json",
    member_id, congress)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}
