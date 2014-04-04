#' Return the top contributoring organizations, ranked by total dollars given. 
#'    An organization's giving is broken down into money given directly (by 
#'    the organization's PAC) versus money given by individuals employed by 
#'    or associated with the organization.
#'    
#' @import httr
#' @template cg
#' @param id The ID of the entity in the given namespace.
#' @param limit Limit to 'limit' number of records.
#' @return The top contributoring organizations, ranked by total dollars given.
#' @export
#' @examples \dontrun{
#' ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981')
#' ts_aggregatetopcontribs(id = '85ab2e74589a414495d18cc7a9233981', limit = 3)
#' }
ts_aggregatetopcontribs <- function(id = NULL, limit = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://transparencydata.com/api/1.0/aggregates/pol/"
  url2 <- paste(url, id, '/contributors.json', sep='')
  args <- suncompact(list(apikey = key, limit = limit))
  tt <- GET(url2, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  fromJSON(out, simplifyVector = FALSE)
}