#' Search OpenStates committees
#'
#' @export
#' @param state state two-letter abbreviation (character)
#' @param chamber one of 'upper' or 'lower' (character)
#' @param committee a committee name (character)
#' @param subcommittee a subcommittee name (character)
#' @param as (character) One of table (default), list, or response
#' (`crul` response object)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Curl options passed on to [crul::HttpClient]
#' @return a data.frame of bills.
#' @details this route appears to not support pagination, sorting or
#' selecting fields
#' @examples \dontrun{
#' os_committees(state = 'tx')
#' os_committees(state = 'tx', chamber = 'upper')
#' os_committees(state = 'dc')
#' }
os_committees <- function(state = NULL, chamber = 'upper', committee = NULL,
  subcommittee = NULL, as ='table', key = NULL, ...) {

  key <- check_key(key, 'OPEN_STATES_KEY')
  args <- sc(list(state = state, chamber = chamber, committee = committee,
    subcommittee = subcommittee))
  give(as, osurl(), "committees", args, key, ...)
}
