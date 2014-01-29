#' Return the top contributoring organizations, ranked by total dollars given. 
#'    An organization's giving is broken down into money given directly (by 
#'    the organization's PAC) versus money given by individuals employed by 
#'    or associated with the organization.
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param id The ID of the entity in the given namespace.
#' @return The top contributoring organizations, ranked by total dollars given.
#' @export
#' @examples \dontrun{
#' ts_aggregatetopsectors(id = '85ab2e74589a414495d18cc7a9233981')
#' }
ts_aggregatetopsectors <- function(id = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://transparencydata.com/api/1.0/aggregates/pol/"
  url2 <- paste(url, id, '/contributors/sectors.json', sep='')
  args <- list(apikey = key)
  tt <- GET(url2, query=args, callopts)
  stop_for_status(tt)
  content(tt)
}
# http://transparencydata.com/api/1.0/aggregates/pol/ff96aa62d48f48e5a1e284efe74a0ba8/contributors/sectors.json?apikey=<your-key>