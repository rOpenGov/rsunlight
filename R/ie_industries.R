#' Organization aggregates: Search for contributions to politicians.
#'
#' @import httr
#' @export
#' @param method (character) The query string. One of top_ind or top_org.
#' @param entity_id (character) The transparencydata ID to look up.
#' @param cycle (character) Filter results to a particular type of entity. One of politician,
#' organization, individual or industry.
#' @param limit (integer) Limit number of records returned.
#' @template ie
#' @return A list. Depends on parameters used. Ranges from a single ID returned to basic
#' information about the the contributions to and from each entity.
#'
#' @examples \dontrun{
#' # Top industries, By contributions given, in dollars.
#' ie_industries(method='top_ind', limit=1)
#' ie_industries(method='top_ind', limit=4)
#'
#' # Top organizations in an industry by dollars contributed
#' ie_industries(method='top_org', entity_id='165d820dd48441e1befdc47f3fa3d236')
#' }

ie_industries <- function(method = NULL, entity_id = NULL, cycle = NULL, limit = NULL,
  page = NULL, per_page = NULL, return='table',
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...)
{
  urlsuffix <- switch(method,
    top_ind = sprintf('industries/top_%s.json', limit),
    top_org = sprintf('industry/%s/orgs.json', entity_id)
  )

  url <- sprintf('http://transparencydata.com/api/1.0/aggregates/%s', urlsuffix)
  if(method=="top_org") limit <- NULL
  args <- suncompact(list(apikey = key, cycle = cycle, limit = limit))

  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
