#' Get recent bills
#'
#' @export
#' @param congress The number of the Congress this update took place during.
#' @param chamber The chamber this update took place in. 'house' or 'senate'
#' @param type Type of bill. introduced, updated, active, passed, enacted
#' or vetoed
#' @template args
#' @return some nasty parsing, so just list of lists for now
#' @examples \dontrun{
#' cg_bills_recent(115, "house", "introduced")
#' }
cg_bills_recent <- function(congress, chamber, type, key = NULL,
  as = 'table', ...) {

  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/%s/bills/%s.json",
    congress, chamber, type)
  res <- foo_bar(as, cgurl(), path, list(), key, ...)
  parse_bills(res)
}
