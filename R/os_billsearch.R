#' Search OpenStates bills.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
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
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_billsearch(terms = 'agriculture', state = 'tx')
#' os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
#' }
os_billsearch <- function(terms = NULL, state = NULL, window = NULL, 
    chamber = 'upper', sponsor_id = NULL,updated_since = NULL, subject = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://openstates.org/api/v1/bills/"
  args <- compact(list(apikey = key, q = terms, state = state, window = window, 
                       chamber = chamber, sponsor_id = sponsor_id, 
                       updated_since = updated_since, subject = subject))
  content(GET(url, query=args, callopts))
}