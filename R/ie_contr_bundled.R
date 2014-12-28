#' Search for itemized bundlers.
#'
#' @export
#' @param lobbyist_name Lobbyist name
#' @param recipient_name Recipient name
#' @template ie
#' @return Details on campaign contributions.
#' @examples \dontrun{
#' ie_contr_bundled(lobbyist_name='Patton Boggs')
#' ie_contr_bundled(lobbyist_name='Patton Boggs', per_page=1)
#' ie_contr_bundled(lobbyist_name='Patton Boggs')
#' }

ie_contr_bundled <-  function(lobbyist_name = NULL, recipient_name = NULL, page = NULL,
  per_page = NULL, return='table', key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  ...)
{
  args <- suncompact(list(apikey = key, lobbyist_name = lobbyist_name,
              recipient_name = recipient_name, page = page, per_page = per_page))
  return_obj(return, query(paste0(ieurl(), "/contributions/bundled.json"), args, ...))
}
