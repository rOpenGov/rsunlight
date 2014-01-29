#' Capitol words text.json method. Search the congressional record for instances 
#' of a word or phrase.
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cw
#' @return Phrases matched.
#' @export
#' @examples \dontrun{
#' cw_text(phrase='climate change', start_date='2012-09-16', end_date='2012-09-20')
#' cw_text(phrase='I would have voted', start_date='2011-09-05', end_date='2011-09-16', party='D')
#' cw_text(phrase='I would have voted', start_date='2011-09-05', end_date='2011-09-16', chamber='House')
#' cw_text(title='personal explanation', start_date='2011-09-05', end_date='2011-09-16')
#' 
#' out <- cw_text(phrase='climate change', start_date='2010-01-01', end_date='2012-12-01')
#' out2 <- ldply(2:13, function(x) cw_text(phrase='climate change', start_date='2010-01-01', end_date='2012-12-01', page=x))
#' alldat <- rbind(out, out2)
#' str(alldat)
#' }

cw_text <- function(phrase=NULL, title=NULL, start_date=NULL, end_date=NULL, 
  chamber=NULL, state=NULL, party=NULL, bioguide_id=NULL, congress=NULL, 
  session=NULL, cr_pages=NULL, volume=NULL, page=NULL, 
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts=list()) 
{
  url = "http://capitolwords.org/api/text.json"
  args <- compact(list(apikey=key, phrase=phrase, start_date=start_date,
                       end_date=end_date, chamber=chamber, state=state, 
                       party=party, bioguide_id=bioguide_id, congress=congress, 
                       session=session, cr_pages=cr_pages, volume=volume, 
                       page=page))  
  out <- GET(url, query=args, callopts)
  stop_for_status(out)
  tt <- content(out)
  message(sprintf('%s records found, %s returned', tt$num_found, length(tt[[2]])))
  data <- lapply(tt[[2]], function(x){
     x[sapply(x, is.null)] <- "none"
     x <- lapply(x, function(x){
       if(length(x)>1){
         paste0(x, collapse=" - ")
       } else { x }
      })
     data.frame(x)
  })
  do.call(rbind.fill, data)
}