#' Get a specific nomination
#'
#' @export
#' @param congress (integer/numeric) the Congress in which this
#' nomination was presented
#' @param id alphanumeric ID beginning with PN - for example, "PN675"
#' @template args
#' @family congress-nominations
#' @examples \dontrun{
#' cg_nomination(115, "PN40")
#' }
cg_nomination <- function(congress, id, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/nominees/%s.json", congress, id)
  foo_bar(as, cgurl(), path, list(), key, ...)$results[[1]]
}
