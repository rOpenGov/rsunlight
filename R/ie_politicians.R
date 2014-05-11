#' Politician aggregrates: Search for contributions to politicians.
#'
#' @import httr
#' @export
#' @param method (character) The query string. Spaces should be URL-encoded or represented
#'    as +. There are no logic operators or grouping.
#' @param entity_id (character) The transparencydata ID to look up.
#' @param cycle (character) Filter results to a particular type of entity. One of politician, 
#'    organization, individual or industry.
#' @param limit (integer) Limit number of records returned.
#' @template cg
#' @return A list. Depends on parameters used. Ranges from a single ID returned to basic 
#'    information about the the contributions to and from each entity.
#'
#' @examples \dontrun{
#' # Top politicians
#' ie_politicians(method='top_pol', limit=1)
#' ie_politicians(method='top_pol', limit=3)
#' 
#' # Top contributors
#' ie_politicians(method='top_con', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' ie_politicians(method='top_con', entity_id='4148b26f6f1c437cb50ea9ca4699417a', cycle=2012)
#' 
#' # Top industries
#' ie_politicians(method='top_ind', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' ie_politicians(method='top_ind', entity_id='4148b26f6f1c437cb50ea9ca4699417a', cycle=2012, limit=1)
#' 
#' # Unkown industries
#' ie_politicians(method='unk_ind', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' 
#' # Top sectors
#' ie_politicians(method='top_sec', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' 
#' # Local breakdown
#' ie_politicians(method='local_breakdown', entity_id='97737bb56b6a4211bcc57a837368b1a4', cycle=2002)
#' 
#' # Type breakdown
#' ie_politicians(method='type_breakdown', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' }
#' 
#' @examples \donttest{
#' # These don't work for some reason
#' ie_politicians(method='fec_summary', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' ie_politicians(method='fec_indexp', entity_id='4148b26f6f1c437cb50ea9ca4699417a')
#' }

ie_politicians <- function(method = NULL, entity_id = NULL, cycle = NULL, limit = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  urlsuffix <- switch(method, 
         top_pol = sprintf('pols/top_%s.json', limit),
         top_con = sprintf('pol/%s/contributors.json', entity_id),
         unk_ind = sprintf('pol/%s/contributors/industries_unknown.json', entity_id),
         top_ind = sprintf('pol/%s/contributors/industries.json', entity_id),
         top_sec = sprintf('pol/%s/contributors/sectors.json', entity_id),
         local_breakdown = sprintf('pol/%s/contributors/local_breakdown.json', entity_id),
         type_breakdown = sprintf('pol/%s/contributors/type_breakdown.json', entity_id),
         fec_summary = sprintf('pol/%s/fec_summary.json', entity_id),
         fec_indexp = sprintf('pol/%s/fec_indexp.json', entity_id))
  
  url <- sprintf('http://transparencydata.com/api/1.0/aggregates/%s', urlsuffix)
  if(method=="top_pol") limit <- NULL
  args <- suncompact(list(apikey = key, cycle = cycle, limit = limit))
  
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  res <- content(tt, as = "text")
  out <- fromJSON(res, simplifyVector = FALSE)
  class(res) <- "ie_politicians"
  return( out )
}