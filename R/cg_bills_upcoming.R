#' Search for upcoming bills
#'
#' @export
#' @param chamber The chamber which has scheduled this bill. house or senate
#' @template args
#' @examples \dontrun{
#' cg_bills_upcoming("house")
#' cg_bills_upcoming("senate")
#' }
cg_bills_upcoming <- function(chamber, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/bills/upcoming/%s.json", chamber)
  res <- foo_bar(as, cgurl(), path, list(), key, ...)
  parse_bills(res)
}
