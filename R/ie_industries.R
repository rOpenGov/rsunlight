#' Organization aggregates: Search for contributions to politicians.
#'
#' @export
#' @param method (character) The query string. One of top_ind or top_org.
#' @param entity_id (character) The transparencydata ID to look up.
#' @param cycle (character) Filter results to a particular type of entity. One of politician,
#' organization, individual or industry.
#' @param limit (integer) Limit number of records returned.
#' @template ie
#' @return A data.frame (default), list, or httr response object.
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
  page = NULL, per_page = NULL, as = 'table',
  key = NULL, ...) {

  key <- check_key(key)
  urlsuffix <- switch(method,
    top_ind = sprintf('industries/top_%s.json', limit),
    top_org = sprintf('industry/%s/orgs.json', entity_id)
  )

  url <- sprintf('%s/aggregates/%s', ieurl(), urlsuffix)
  if (method == "top_org") limit <- NULL
  args <- sc(list(apikey = key, cycle = cycle, limit = limit))

  return_obj(as, query(url, args, ...))
}
