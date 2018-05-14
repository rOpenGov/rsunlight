#' Search OpenStates metadata
#'
#' @export
#' @param state One or more two-letter state abbreviations (character)
#' @param key your SunlightLabs API key; loads from environment variable
#' from .Renviron or from an option from .Rprofile
#' @param ... Optional additional curl options (debugging tools mostly)
#' passed on to [crul::HttpClient]
#' @return A list with metadata for each state.
#' @examples \dontrun{
#' os_statemetasearch()
#' os_statemetasearch('ca')
#' os_statemetasearch('tx')
#' os_statemetasearch('tx', verbose = TRUE)
#' }
os_statemetasearch <- function(state = NULL, key = NULL, ...) {
  key <- check_key(key, 'OPEN_STATES_KEY')
  url <- file.path(osurl(), "api/v1/metadata")
  if (!is.null(state)) url <- file.path(url, state)
  tt <- crul::HttpClient$new(url,
    headers = list(`X-API-KEY` = key),
    opts = list(...)
  )
  res <- tt$get()
  res$raise_for_status()
  jsonlite::fromJSON(res$parse("UTF-8"))
}
