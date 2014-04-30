#' Search congress people and senate members.
#'
#' @import httr
#' @template cg
#' @param name name to search for
#' @param threshold optional threshold parameter specifying minimum score to
#'    return (defaults to 0.8, lower values not recommended)
#' @param all_legislators optional parameter to search all legislators in API,
#'    not just those currently in office (false by default)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' cg_getlegislatorsearch(name = 'Reed')
#' }
cg_getlegislatorsearch <- function(name=NULL, threshold=NULL,
  all_legislators=NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://services.sunlightlabs.com/api/legislators.search.json"
  args <- suncompact(list(apikey = key, name=name, threshold=threshold,
                       all_legislators=all_legislators))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)$response
  class(res) <- "cg_getlegislatorsearch"
  return( res )
}
