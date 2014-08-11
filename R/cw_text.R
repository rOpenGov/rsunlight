#' Capitol words text.json method. Search the congressional record for instances
#' of a word or phrase.
#'
#' @import httr
#' @importFrom plyr compact
#' @template cw
#' @template cw_dates_text
#' @param page The page of results to show, 50 results are shown at a time.
#' @param sort The value on which to sort the results. You have to specify ascending or descending
#' (see details), but if you forget, we make it ascending by default (prevents 500 error :)).
#' See Details.
#' @return Phrases matched in a data.frame.
#' @export
#' @details
#' Options for the \code{sort} parameter are:
#' \itemize{
#'  \item speaker_state
#'  \item congress
#'  \item title
#'  \item number
#'  \item volume
#'  \item chamber
#'  \item session
#'  \item id
#'  \item speaker_party
#'  \item date
#'  \item bioguide_id
#'  \item pages
#' }
#'
#' Coupled with a direction, \code{asc} or \code{desc}. An example to sort by true chronological
#' order and chamber (id works for this purpose) would be \code{id desc}.
#'
#' @examples \dontrun{
#' cw_text(phrase='climate change', start_date='2012-09-16', end_date='2012-09-20')
#' cw_text(phrase='I would have voted', start_date='2011-09-05', end_date='2011-09-16', party='D')
#' cw_text(phrase='I would have voted', start_date='2011-09-05', end_date='2011-09-16', 
#'    chamber='House')
#' cw_text(title='personal explanation', start_date='2011-09-05', end_date='2011-09-16')
#'
#' library('plyr')
#' out <- cw_text(phrase='climate change', start_date='2010-01-01', end_date='2012-12-01')
#' out2 <- ldply(2:6, function(x) cw_text(phrase='climate change', start_date='2010-01-01', 
#'    end_date='2012-12-01', page=x))
#' alldat <- rbind(out, out2)
#' str(alldat)
#'
#' cw_text(phrase='climate change', start_date='2012-09-16', end_date='2012-09-20', sort='title')
#' }

cw_text <- function(phrase=NULL, title=NULL, date = NULL, start_date=NULL, end_date=NULL,
  chamber=NULL, state=NULL, party=NULL, bioguide_id=NULL, congress=NULL,
  session=NULL, cr_pages=NULL, volume=NULL, page=NULL, sort=NULL, return='table',
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...)
{
  url = "http://capitolwords.org/api/text.json"
  if(!is.null(sort)){
    if(!grepl('asc|desc', sort))
      sort <- paste(sort, 'asc')
  }
  args <- suncompact(list(apikey=key, phrase=phrase, start_date=start_date,
      date = date, end_date=end_date, chamber=chamber, state=state, party=party,
      bioguide_id=bioguide_id, congress=congress, session=session, cr_pages=cr_pages, volume=volume,
      page=page, sort=sort))
  out <- GET(url, query=args, ...)
  stop_for_status(out)
  tmp <- return_obj(return, out)
  if(return=='response') tmp else tmp$results
}
