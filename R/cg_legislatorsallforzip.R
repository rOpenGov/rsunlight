#' Search congress people and senate members for a zip code.
#' 
#' @import httr
#' @param zip zip code to search
#' @template cg
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' cg_legislatorsallforzip(zip = 77006)
#' }
cg_legislatorsallforzip <- function(zip = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://services.sunlightlabs.com/api/legislators.allForZip.json"
  args <- suncompact(list(apikey = key, zip = zip))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  fromJSON(out, simplifyVector = FALSE)$response
}