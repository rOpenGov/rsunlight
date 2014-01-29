#' Capitol words dates.json method. Search the congressional record for 
#' instances of a word or phrase over time.
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cw
#' @return Data frame or JSON object of observations by date.
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
  args <- compact(list(apikey = key, phrase = phrase, title = title, 
                       start_date = start_date, end_date = end_date, 
                       chamber = chamber, state = state, party = party, 
                       bioguide_id = bioguide_id, congress = congress, 
                       session = session, cr_pages = cr_pages, volume = volume, 
                       page_id = page_id, n = n, granularity = granularity, 
                       percentages = percentages))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt)
  df <- rbind.fill(lapply(out[[1]], data.frame))
  df
}