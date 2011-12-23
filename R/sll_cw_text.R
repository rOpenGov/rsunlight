#' Capitol words text.json method. Search the congressional record for 
#'    instances of a word or phrase.
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
#' @param url the Sunlight Labs API url for the function (leave as default).
#' @param key Your SunlightLabs API key; loads from .Rprofile.
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Phrases matched.
#' @export
#' @examples \dontrun{
#' sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16')
#' sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', party='D')
#' sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', chamber='House')
#' sll_cw_text(title='personal explanation', startdate='2011-09-05', enddate='2011-09-16')
#' }
sll_cw_text <- 

function(phrase = NA, title = NA, start_date = NA, end_date = NA, chamber = NA, 
  state = NA, party = NA, bioguide_id = NA, congress = NA, session = NA, 
  cr_pages = NA, volume = NA, page_id = NA, 
  url = "http://capitolwords.org/api/text.json",
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
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}