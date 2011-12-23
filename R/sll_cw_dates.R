#' Capitol words dates.json method. Search the congressional record for 
#'    instances of a word or phrase over time.
#' @import RJSONIO RCurl plyr
#' @param phrase Phrase to search.
#' @param title Title of page to search.
#' @param start_date Start date to search on.
#' @param end_date End date to search on.
#' @param chamber Chamber of congress, House or Senate.
#' @param state State, capital two-letter abbreviation (e.g., AK,AZ,NM).
#' @param party Political party (one of D,R,I).
#' @param bioguide_id Bioguide ID for politician (e.g., B000243)
#' @param congress Congressional session (e.g., 110,111,112)
#' @param session Session within the current congress (e.g., 1,2)
#' @param cr_pages No definition.
#' @param volume No definition.
#' @param page_id No definition.
#' @param n No definition.
#' @param granularity Month, year, day.
#' @param percentages Give percentages or not.
#' @param printdf print data.frame (default, TRUE) or not (FALSE)
#' @param url the Sunlight Labs API url for the function (leave as default).
#' @param key Your SunlightLabs API key; loads from .Rprofile.
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Data frame or JSON object of observations by date.
#' @export
#' @examples \dontrun{
#' sll_cw_dates(phrase='I would have voted', start_date='2001-01-20', 
#'    end_date='2009-01-20', granularity='year', party='D', percentages=TRUE, 
#'    printdf=TRUE)
#' }
sll_cw_dates <- 

function(phrase = NA, title = NA, start_date = NA, end_date = NA, chamber = NA, 
  state = NA, party = NA, bioguide_id = NA, congress = NA, session = NA, 
  cr_pages = NA, volume = NA, page_id = NA, n = NA, granularity = NA, 
  percentages = TRUE, printdf = TRUE, 
  url = "http://capitolwords.org/api/dates.json",
  key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  ...,
  curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(phrase))
    args$phrase <- gsub(' ', '+', phrase)
  if(!is.na(start_date))
    args$start_date <- start_date
  if(!is.na(end_date))
    args$end_date <- end_date
  if(!is.na(chamber))
    args$chamber <- chamber
  if(!is.na(state))
    args$state <- state
  if(!is.na(party))
    args$party <- party
  if(!is.na(bioguide_id))
    args$bioguide_id <- bioguide_id
  if(!is.na(congress))
    args$congress <- congress
  if(!is.na(session))
    args$session <- session
  if(!is.na(cr_pages))
    args$cr_pages <- cr_pages
  if(!is.na(volume))
    args$volume <- volume
  if(!is.na(page_id))
    args$page_id <- page_id
  if(!is.na(n))
    args$n <- n
  if(!is.na(granularity))
    args$granularity <- granularity
  if(!is.na(percentages))
    args$percentages <- percentages
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  out <- fromJSON(tt)
  if(printdf == TRUE){
    df <- ldply(out[[1]], function(x) t(as.data.frame(x)))
    names(df) <- c('count','yearmonth')
    df
  } else 
    {out}
}