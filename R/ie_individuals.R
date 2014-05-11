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
#' # Top individuals
#' ie_individuals(method='top_ind', limit=1)
#' ie_individuals(method='top_ind', limit=3)
#' 
#' # Top recipient organizations
#' ie_individuals(method='top_recorg', entity_id='a03df5d9b20e467fa0ceaefa94c4491e')
#' ie_individuals(method='top_recorg', entity_id='a03df5d9b20e467fa0ceaefa94c4491e', 
#'    cycle=2012, limit=1)
#' 
#' # Top recipients politicians
#' ie_individuals(method='top_recpol', entity_id='a03df5d9b20e467fa0ceaefa94c4491e')
#' ie_individuals(method='top_recpol', entity_id='a03df5d9b20e467fa0ceaefa94c4491e', 
#'    cycle=2012, limit=1)
#' 
#' # Party breakdown
#' ie_individuals(method='party_breakdown', entity_id='cc768536a9434b9da6fef5846a16ee88')
#' 
#' # Lobbying registrants
#' ie_individuals(method='lobb_reg', entity_id='4d052c80ef184ce5a5e41e6d34dc452f')
#' 
#' # Lobbying clients
#' ie_individuals(method='lobb_cli', entity_id='4d052c80ef184ce5a5e41e6d34dc452f', cycle=2002)
#' 
#' # Lobbying issues
#' ie_individuals(method='lobb_iss', entity_id='4d052c80ef184ce5a5e41e6d34dc452f', limit=2)
#' }

ie_individuals <- function(method = NULL, entity_id = NULL, cycle = NULL, limit = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  urlsuffix <- switch(method, 
                      top_ind = sprintf('indivs/top_%s.json', limit),
                      top_recorg = sprintf('indiv/%s/recipient_orgs.json', entity_id),
                      top_recpol = sprintf('indiv/%s/recipient_pols.json', entity_id),
                      party_breakdown = sprintf('indiv/%s/recipients/party_breakdown.json', entity_id),
                      lobb_reg = sprintf('indiv/%s/registrants.json', entity_id),
                      lobb_cli = sprintf('indiv/%s/clients.json', entity_id),
                      lobb_iss = sprintf('indiv/%s/issues.json', entity_id))
   
  url <- sprintf('http://transparencydata.com/api/1.0/aggregates/%s', urlsuffix)
  if(method=="top_ind") limit <- NULL
  args <- suncompact(list(apikey = key, cycle = cycle, limit = limit))
  
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  res <- content(tt, as = "text")
  out <- fromJSON(res, simplifyVector = FALSE)
  class(res) <- "ie_individuals"
  return( out )
}