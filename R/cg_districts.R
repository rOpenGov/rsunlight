#' Get districts for a latitude/longitude or zips
#'
#' @import httr
#' @export
#' @template cg
#' @param latitude (numeric) latitude of coordinate
#' @param longitude (numeric) longitude of coordinate
#' @param zip (integer) A 5 digit zip code
#' @return List including data.frame and metadata about results, list, or httr 
#' response object.
#' @examples \dontrun{
#' cg_districts(zip = 27511)
#' cg_districts(latitude = 35.778788, longitude = -78.787805)
#' }

cg_districts <- function(latitude = NULL, longitude = NULL, zip = NULL, per_page=20, page=1,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  return='table', ...)
{
  url = "https://congress.api.sunlightfoundation.com/districts/locate"
  args <- suncompact(list(apikey = key, latitude = latitude, longitude = longitude, zip = zip, 
                          per_page=per_page, page=page))
  tt <- GET(url, query=args, ...)
  warn_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  
  return <- match.arg(return, c('response','list','table','data.frame'))
  if(return=='response'){ tt } else {
    out <- content(tt, as = "text")
    res <- fromJSON(out, simplifyVector = FALSE)
    class(res) <- "cg_districts"
    if(return=='list') res else fromJSON(out)
  }
}
