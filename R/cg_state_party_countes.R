#' state party counts
#'
#' @export
#' @template args
#' @examples \dontrun{
#' cg_state_party_countes()
#' }
cg_state_party_countes <- function(key = NULL, as = 'table', ...) {
  path <- "congress/v1/states/members/party.json"
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}
