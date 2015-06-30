#' Search for itemized misconduct incident reports
#'
#' @param contractor (character)	The name of the contractor to search for.
#' @param contracting_party (character)  The FIPS code for the contracting agency.
#' @param date_year (numeric) The year in which a date significant to the incident occurred.
#' @param enforcement_agency (character)	The name of the agency responsible for the enforcement action.
#' @param instance (character)  Full-text search on the description of the misconduct instance.
#' @param penalty_amount (numeric) The amount of the penalty, in US dollars.
#' @template ie
#' @return A data.frame (default), list, or httr response object.
#' @export
#' @examples \dontrun{
#' ie_misconduct(contractor='SAIC', date_year=2012)
#' ie_misconduct(instance='Castle Harbour Tax Shelter')
#' ie_misconduct(date_year=2012, per_page=2)
#'
#' ie_misconduct(penalty_amount=5000000)
#' ie_misconduct(contractor='GlaxoSmithKline', per_page=3)
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_misconduct(date_year = c(2010, 2011), per_page=2)
#' }

ie_misconduct <- function(contractor = NULL, contracting_party = NULL, date_year = NULL,
  enforcement_agency = NULL, instance = NULL, penalty_amount = NULL, page = NULL, per_page = NULL,
  as = 'table', key = NULL, ...) {

  key <- check_key(key)
  if (!is.null(penalty_amount)) penalty_amount <- as.integer(penalty_amount)
  args <- sc(list(apikey = key, contractor = contractor,
    contracting_party = contracting_party, date_year = date_year, enforcement_agency = enforcement_agency,
    instance = instance, penalty_amount = penalty_amount, page = page, per_page = per_page))
  give(as, ieurl(), "/misconduct.json", args, ...)
}
