#' Get recent nominations by categroy
#'
#' @export
#' @param congress (integer/numeric) the Congress in which this
#' nomination was presented
#' @param type (character) received, updated, confirmed, or withdrawn
#' @template args
#' @family congress-nominations
#' @examples \dontrun{
#' cg_nominations_category(115, "confirmed")
#' }
cg_nominations_category <- function(congress, type, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/nominees/%s.json", congress, type)
  x <- foo_bar(as, cgurl(), path, list(), key, ...)$results
  tibble::as_tibble(as_dt(lapply(x, function(z) {
    z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
    z[vapply(z, length, numeric(1)) == 0] <- NA_character_
    return(z)
  })))
}
