#' Search itemized EPA enforcement actions.
#' 
#' @import httr
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
#' @return A list, as class ie_epa.
#' @export
#' @examples \dontrun{
#' ie_epa(defendants='Massey Energy', per_page=1)
#' ie_epa(defendants='Massey Energy', per_page=1, return='list')
#' ie_epa(defendants='Massey Energy', per_page=1, return='response')
#' ie_epa(defendants='Massey Energy', first_date='>|2005-01-01')
#' }

ie_epa <- function(case_name = NULL, case_num = NULL, defendants = NULL, first_date = NULL, 
  last_date = NULL, location_addresses = NULL, penalty = NULL, page = NULL, return='table',
  per_page = NULL, key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...) 
{
  url <- "http://transparencydata.com/api/1.0/epa.json"
  args <- suncompact(list(apikey = key, case_name = case_name, case_num = case_num, 
    defendants = defendants, first_date = first_date, last_date = last_date, 
    location_addresses = location_addresses, penalty = penalty, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
