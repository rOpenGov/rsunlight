#' Search for itemized misconduct incident reports
#' 
#' @import httr
#' @param contractor (character)	The name of the contractor to search for.
#' @param contracting_party (character)  The FIPS code for the contracting agency.
#' @param date_year (numeric) The year in which a date significant to the incident occurred.
#' @param enforcement_agency (character)	The name of the agency responsible for the enforcement action.
#' @param instance (character)  Full-text search on the description of the misconduct instance.
#' @param penalty_amount (numeric) The amount of the penalty, in US dollars.
#' @template ie
#' @return A list, as class ie_misconduct.
#' @export
#' @examples \dontrun{
#' ie_misconduct(contractor='SAIC', date_year=2012)
#' ie_misconduct(instance='Castle Harbour Tax Shelter')
#' ie_misconduct(date_year=2012, per_page=2)
#' 
#' ie_misconduct(penalty_amount=5000000)
#' ie_misconduct(contractor='GlaxoSmithKline', per_page=3)
#' }

ie_misconduct <- function(contractor = NULL, contracting_party = NULL, date_year = NULL,
  enforcement_agency = NULL, instance = NULL, penalty_amount = NULL, page = NULL, per_page = NULL,
  return='table', key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...) 
{
  if(!is.null(penalty_amount)) penalty_amount <- as.integer(penalty_amount)
  url <- "http://transparencydata.com/api/1.0/misconduct.json"
  args <- suncompact(list(apikey = key, contractor = contractor, 
    contracting_party = contracting_party, date_year = date_year, enforcement_agency = enforcement_agency, 
    instance = instance, penalty_amount = penalty_amount, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  tmp <- return_obj(return, tt)
  tmp$penalty_amount <- format(tmp$penalty_amount, scientific = FALSE)
  tmp
}
