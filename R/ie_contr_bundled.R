#' Search for itemized bundlers.
#' 
#' @import httr
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
  url <- "http://transparencydata.com/api/1.0/contributions/bundled.json"
  args <- suncompact(list(apikey = key, lobbyist_name = lobbyist_name, 
              recipient_name = recipient_name, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
