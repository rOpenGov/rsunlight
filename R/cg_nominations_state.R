#' Get nominees by state
#'
#' @export
#' @param congress (integer/numeric) the Congress in which this
#' nomination was presented
#' @param state (character) state Two-letter state abbreviation
#' @template args
#' @family congress-nominations
#' @examples \dontrun{
#' cg_nominations_state(115, "VA")
#' }
cg_nominations_state <- function(congress, state, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/nominees/state/%s.json", congress, state)
  x <- foo_bar(as, cgurl(), path, list(), key, ...)$results
  tibble::as_tibble(as_dt(lapply(x, function(z) {
    z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
    z[vapply(z, length, numeric(1)) == 0] <- NA_character_
    return(z)
  })))
}
