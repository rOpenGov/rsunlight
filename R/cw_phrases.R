#' Capitol words phrases.json method. List the top phrases for a facet.
#'
#' @import httr
#' @export
#' @param entity_type The entity type to get top phrases for. One of 'date', 'month', 'state', or 
#'    'legislator'. 
#' @param entity_value The value of the entity given in \code{entity_type}. See Details.
#' @param n The size of phrase, in words, to search for (up to 5).
#' @param page The page of results to show. 100 results are shown at a time. To get more than 
#' 100 results, use the page parameter.
#' @param sort The value on which to sort the results. You have to specify ascending or descending 
#' (see details), but if you forget, we make it ascending by default (prevents 500 error :)). 
#' Valid values are 'tfidf' (default) and 'count'. 
#' @param key Your SunlightLabs API key; loads from .Rprofile.
#' @param callopts Further curl options (debugging tools mostly)
#' @return Data frame of observations by date.
#' @examples \dontrun{
#' cw_phrases(entity_type='month', entity_value=201007)
#' cw_phrases(entity_type='state', entity_value='NV')
#' cw_phrases(entity_type='legislator', entity_value='L000551')
#' }
cw_phrases <- function(entity_type = NULL, entity_value = NULL, n = NULL, page = NULL, sort = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://capitolwords.org/api/phrases.json"
  if(!is.null(sort)){
    if(!grepl('asc|desc', sort))
      sort <- paste(sort, 'asc')
  }
  args <- suncompact(list(apikey = key, entity_type=entity_type, entity_value=entity_value, 
                          n=n, page=page, sort=sort))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  output <- fromJSON(out, simplifyVector = FALSE)
  df <- rbind.fill(lapply(output, data.frame))
  return( df )
}
