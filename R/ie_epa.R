#' Search itemized EPA enforcement actions.
#'
#' @param case_name (character) The name of the enforcement case.
#' @param case_num (character) One or more specific case numbers.
#' @param defendants (character) Full-text search for the name(s) of the defendant companies.
#' @param first_date (character) Start of a date range of the most recent date of significance to
#' the case in ISO format.
#' @param last_date (character) End of a date range of the most recent date of significance to the
#' case in ISO format.
#' @param location_addresses (character) Full-text search on all addresses associated with the case.
#' @param penalty (integer) Total penalties, in US dollars.
#' @template ie
#' @return A data.frame, list, or httr response object
#' @export
#' @examples \dontrun{
#' ie_epa(defendants='Massey Energy', per_page=1)
#' ie_epa(defendants='Massey Energy', per_page=1, as='list')
#' ie_epa(defendants='Massey Energy', per_page=1, as='response')
#' ie_epa(defendants='Massey Energy', first_date='>|2005-01-01')
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_epa(defendants = c('Massey Energy', 'Hannah Steel'))
#' ie_epa(case_num = c('04-1986-0004', '04-1986-0003'))
#' }

ie_epa <- function(case_name = NULL, case_num = NULL, defendants = NULL, first_date = NULL,
  last_date = NULL, location_addresses = NULL, penalty = NULL, page = NULL, as = 'table',
  per_page = NULL, key = NULL, ...) {

  key <- check_key(key)
  args <- sc(list(apikey = key, case_name = case_name, case_num = case_num,
    defendants = defendants, first_date = first_date, last_date = last_date,
    location_addresses = location_addresses, penalty = penalty, page = page, per_page = per_page))
  give(as, ieurl(), "/epa.json", args, ...)
}
