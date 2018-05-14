#' Get recent bills by member id
#'
#' @export
#' @param id (character) The ID of the member to retrieve; it is
#' assigned by the Biographical Directory of the United States
#' Congress (<http://bioguide.congress.gov/biosearch/biosearch.asp>)
#' or can be retrieved from a [cg_members()] request
#' @param type Type of bill. introduced or updated
#' @template args
#' @return some nasty parsing, so just list of lists for now
#' @examples \dontrun{
#' cg_bills_recent_member("L000287", "introduced")
#' }
cg_bills_recent_member <- function(id, type, key = NULL,
  as = 'table', ...) {

  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/members/%s/bills/%s.json", id, type)
  res <- foo_bar(as, cgurl(), path, list(), key, ...)
  parse_bills(res)
}
