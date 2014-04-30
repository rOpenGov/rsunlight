#' Capitol words dates.json method. Search the congressional record for
#' instances of a word or phrase over time.
#'
#' @import httr
#' @template cw
#' @template cw_dates_text
#' @param page_id Page id.
#' @param n Size, not sure what this is.
#' @param percentages Include the percentage of mentions versus total words in
#'    the result objects. Valid values: 'true', 'false' (default) (character)
#' @param granularity The length of time covered by each result. Valid values:
#'    'year', 'month', 'day' (default)
#' @return Data frame of observations by date.
#' @export
#' @examples \dontrun{
#' cw_dates(phrase='I would have voted', start_date='2001-01-20',
#'    end_date='2009-01-20', granularity='year', party='D')
#' }
cw_dates <- function(phrase = NULL, title = NULL, start_date = NULL,
  end_date = NULL, chamber = NULL, state = NULL, party = NULL, bioguide_id = NULL,
  congress = NULL, session = NULL, cr_pages = NULL, volume = NULL, page_id = NULL,
  n = NULL, granularity = NULL, percentages = 'true',
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  url = "http://capitolwords.org/api/dates.json"
  args <- suncompact(list(apikey = key, phrase = phrase, title = title,
                       start_date = start_date, end_date = end_date,
                       chamber = chamber, state = state, party = party,
                       bioguide_id = bioguide_id, congress = congress,
                       session = session, cr_pages = cr_pages, volume = volume,
                       page_id = page_id, n = n, granularity = granularity,
                       percentages = percentages))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  output <- fromJSON(out, simplifyVector = FALSE)
  df <- rbind.fill(lapply(output[[1]], data.frame))
  return( df )
}
