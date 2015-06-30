#' Search for itemized bundlers.
#'
#' @export
#' @param lobbyist_name Lobbyist name
#' @param recipient_name Recipient name
#' @template ie
#' @return A data.frame, list, or httr response object.
#' @examples \dontrun{
#' ie_contr_bundled(lobbyist_name='Patton Boggs')
#' ie_contr_bundled(lobbyist_name='Patton Boggs', per_page=1)
#' ie_contr_bundled(lobbyist_name='Patton Boggs')
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_contr_bundled(lobbyist_name = c('Patton Boggs', 'Ben Barnes'))
#' ie_contr_bundled(recipient_name = c('Mitch McConnell', 'Rick Perry'))
#' }

ie_contr_bundled <-  function(lobbyist_name = NULL, recipient_name = NULL, page = NULL,
  per_page = NULL, as = 'table', key = NULL, ...) {

  key <- check_key(key)
  args <- sc(list(apikey = key, lobbyist_name = lobbyist_name,
              recipient_name = recipient_name, page = page, per_page = per_page))
  give(as, ieurl(), "/contributions/bundled.json", args, ...)
}
