#' Search OpenStates bills.
#'
#' @import httr
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
#' @param type (character) Only bills of a given type (e.g. 'bill', 'resolution', etc.)
#' @param search_window By default all bills are searched, but if a time window is desired the 
#' following options can be passed to search_window: all (Default, include all sessions.), 
#' term (Only bills from sessions within the current term.), session (Only bills from the current 
#' session.), session:2009 (Only bills from the session named 2009.), term:2009-2011 (Only bills 
#' from the sessions in the 2009-2011 session.)
#' @param sort (character) One of 'first' (default), 'last', 'signed', 'passed_lower', 
#'    'passed_upper', 'updated_at', or 'created_at'. 
#' @param page (numeric) Page to return, starting at 1. Defaults to 1.
#' @param per_page (numeric) Number of results per page, is unlimited unless page is set, 
#'    in which case it defaults to 50
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_billsearch(terms = 'agriculture', state = 'tx')
#' os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
#' os_billsearch(terms = 'taxi', state = 'dc')
#' os_billsearch(terms = 'taxi', state = 'dc', per_page=3)
#' os_billsearch(terms = 'taxi', state = 'dc', per_page=3, sort='created_at')
#' os_billsearch(terms = 'taxi', state = 'dc', type='resolution')
#' 
#' # Search window
#' length(os_billsearch(terms = 'climate change', search_window='term'))
#' length(os_billsearch(terms = 'climate change', search_window='term:2009-2011'))
#' length(os_billsearch(terms = 'climate change', search_window='session'))
#' length(os_billsearch(terms = 'climate change', search_window='session:2009'))
#' }
os_billsearch <- function(terms = NULL, state = NULL, window = NULL,
    chamber = 'upper', sponsor_id = NULL, updated_since = NULL, subject = NULL, type=NULL,
    search_window=NULL, sort=NULL, page=NULL, per_page=NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://openstates.org/api/v1/bills/"
  args <- suncompact(list(apikey = key, q = terms, state = state, window = window,
                       chamber = chamber, sponsor_id = sponsor_id,
                       updated_since = updated_since, subject = subject, type=type, 
                       search_window=search_window, sort=sort, page=page, per_page=per_page))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  class(res) <- "os_billsearch"
  return( res )
}