#' Search OpenStates bills.
#' @import RJSONIO RCurl
#' @param terms search terms bill search (character)
#' @param state state two-letter abbreviation (character)
#' @param window a string representing what time period to search across. 
#'    Pass 'session' to search bills from the state's current or most 
#'    recent legislative session, 'term' to search the current or most 
#'    recent term, 'all' to search as far back as the Open State Project 
#'    has data for, or supply 'session:SESSION_NAME' or 'term:TERM_NAME' 
#'    (e.g. 'session:2009' or 'term:2009-2010') to search a specific 
#'    session or term.
#' @param chamber one of 'upper' or 'lower' (character)
#' @param sponsor_id only return bills sponsored by the legislator with the 
#'    given id (corresponds to leg_id)
#' @param updated_since only return bills that have been updated since a given date, 
#'    YYYY-MM-DD format
#' @param subject filter by bills that are about a given subject. If multiple 
#'    subject parameters are supplied then only bills that match all of 
#'    them will be returned. See list of subjects
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_billsearch(terms = 'agriculture', state = 'tx')
#' sll_os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
#' }
sll_os_billsearch <- 

function(terms, state = NA, window = NA, chamber = 'upper', sponsor_id = NA,
    updated_since = NA, subject = NA, url = "http://openstates.org/api/v1/bills/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(terms))
    args$q <- terms
  if(!is.na(state))
    args$state <- state
  if(!is.na(chamber))
    args$chamber <- chamber
  if(!is.na(window))
    args$search_window <- window
  if(!is.na(sponsor_id))
    args$sponsor_id <- sponsor_id
  if(!is.na(updated_since))
    args$updated_since <- updated_since
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}