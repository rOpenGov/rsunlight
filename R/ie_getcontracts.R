#' Get federal contract details
#'
#' @import httr
#' @template ie
#' @param agency_id The FIPS code for the agency.
#' @param agency_name Full-text search on the name of the agency.
#' @param contracting_agency_id The FIPS code for the contracting agency.
#' @param contracting_agency_name Full-text search on the name of the contracting agency.
#' @param current_amount Current value of the contract in US dollars in one of the following
#' formats: 500 (exactly 500 dollars), >|500 (greater than or equal to 500 dollars),
#' <|500 (less than or equal to 500 dollars)
#' @param fiscal_year The year in which the grant was awarded. A YYYY formatted year (2006 - 2010)
#' @param maximum_amount Maximum possible value of the contract in US dollars
#' (see \code{current_amount}).
#' @param place_district The congressional district in which the contract action will be performed.
#' @param place_state_code FIPS code for state in which the contract action will be performed.
#' @param requesting_agency_id The FIPS code for the requesting agency.
#' @param requesting_agency_name Full-text search on the name of the contracting agency.
#' @param obligated_amount The amount obligated or de-obligated by the transaction in US dollars
#' (see \code{current_amount}).
#' @param vendor_city Full-text search on the name of the primary city in which the contractor does
#' business.
#' @param vendor_district The primary congressional district in which the contractor does business.
#' @param vendor_duns The Dun and Bradstreet number assigned to the contractor.
#' @param vendor_name Full-text search on the name of the contractor.
#' @param vendor_parent_duns The Dun and Bradstreet number assigned to the corporate parent of the
#' contractor.
#' @param vendor_state The primary state in which the contractor does business.
#' @param vendor_zipcode The primary zipcode in which the contractor does business.
#' @return Details on federal government contracts in a list.
#' @export
#' @examples \dontrun{
#' ie_contracts(vendor_city='indianapolis', page=1, per_page=5)
#' 
#' library('httr')
#' ie_contracts(vendor_city='indianapolis', page=1, per_page=5, config=verbose())[,c(1:5)]
#' }
ie_contracts <-  function(
    agency_id = NULL,
    agency_name = NULL,
    contracting_agency_id = NULL,
    contracting_agency_name = NULL,
    current_amount = NULL,
    fiscal_year = NULL,
    maximum_amount = NULL,
    place_district = NULL,
    place_state_code = NULL,
    requesting_agency_id = NULL,
    requesting_agency_name = NULL,
    obligated_amount = NULL,
    vendor_city = NULL,
    vendor_district = NULL,
    vendor_duns = NULL,
    vendor_name = NULL,
    vendor_parent_duns = NULL,
    vendor_state = NULL,
    vendor_zipcode = NULL,
    page = NULL,
    per_page = NULL, return='table',
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...)
{
  url <- "http://transparencydata.com/api/1.0/contracts.json"
  args <- suncompact(list(apikey = key, agency_id = agency_id,
    agency_name = agency_name, contracting_agency_id = contracting_agency_id,
    contracting_agency_name = contracting_agency_name, current_amount = current_amount,
    fiscal_year = fiscal_year, maximum_amount = maximum_amount, place_district = place_district,
    place_state_code = place_state_code, requesting_agency_id = requesting_agency_id,
    requesting_agency_name = requesting_agency_name, obligated_amount = obligated_amount,
    vendor_city = vendor_city, vendor_district = vendor_district, vendor_duns = vendor_duns,
    vendor_name = vendor_name, vendor_parent_duns = vendor_parent_duns, vendor_state = vendor_state,
    vendor_zipcode = vendor_zipcode, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
