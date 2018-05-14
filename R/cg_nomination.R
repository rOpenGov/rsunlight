#' nominations methods
#'
#' @export
#' @name nominations
#' @param congress (integer/numeric) the Congress in which this
#' nomination was presented
#' @param id alphanumeric ID beginning with PN - for example, "PN675"
#' @param type (character) received, updated, confirmed, or withdrawn
#' @param state (character) state Two-letter state abbreviation
#' @template args
#' @details
#'
#' - `cg_nomination`: Get a specific nomination
#' - `cg_nominations_category`: Get recent nominations by categroy
#' - `cg_nominations_state`: Get nominees by state
#'
#' @examples \dontrun{
#' cg_nomination(115, "PN40")
#' cg_nominations_category(115, "confirmed")
#' cg_nominations_state(115, "VA")
#' }
cg_nomination <- function(congress, id, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/nominees/%s.json", congress, id)
  foo_bar(as, cgurl(), path, list(), key, ...)$results[[1]]
}

#' @export
#' @rdname nominations
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

#' @export
#' @rdname nominations
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
