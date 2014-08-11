#' Get federal grant details
#' 
#' @import httr
#' @template ie
#' @param agency_ft Full-text search on the reported name of the federal agency awarding the grant.
#' @param amount_total Total amount of the grant in US dollars in one of the following formats: 500 (exactly 500 dollars), >|500 (greater than or equal to 500 dollars), <|500 (less than or equal to 500 dollars)
#' @param assistance_type A general code for the type of grant awarded: \dQuote{02} (block grant), \dQuote{03} (formula grant), \dQuote{04} (project grant), \dQuote{05} (cooperative agreement), \dQuote{06} (direct payment, as a subsidy or other non-reimbursable direct financial aid), \dQuote{07} (direct loan), \dQuote{08} (guaranteed/insured loan), \dQuote{09} (insurance), \dQuote{10} (direct payment with unrestricted use), or \dQuote{11} (other reimbursable, contingent, intangible or indirect financial assistance).
#' @param fiscal_year A YYYY formatted year (1990 - 2010) as a single year or YYYY|YYYY for an OR logic.
#' @param recipient_ft Full-text search on the reported name of the grant recipient.
#' @param recipient_state Two-letter abbreviation of the state in which the grant was awarded.
#' @param recipient_type The type of entity that received the grant: \dQuote{00} (State government), \dQuote{01} (County government), \dQuote{02} (City or township government), \dQuote{04} (Special district government), \dQuote{05} (Independent school district), \dQuote{06} (State controlled institution of higher education), \dQuote{11} (Indian tribe), \dQuote{12} (Other nonprofit), \dQuote{20} (Private higher education), \dQuote{21} (Individual), \dQuote{22} (Profit organization), \dQuote{23} (Small business), or \dQuote{25} (Other).
#' @return Details on federal grants.
#' @export
#' @examples \dontrun{
#' ie_grants(agency_ft='Agency For International Development', fiscal_year=2012, per_page=1)
#' }
ie_grants <-  function(
    agency_ft = NULL,
    amount_total = NULL,
    assistance_type = NULL,
    fiscal_year = NULL,
    recipient_ft = NULL,
    recipient_state = NULL,
    recipient_type = NULL,
    page = NULL,
    per_page = NULL,  return='table',
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...) 
{
  url <- "http://transparencydata.com/api/1.0/grants.json"
  args <- suncompact(list(apikey = key, agency_ft = agency_ft,
    amount_total = amount_total, assistance_type = assistance_type, fiscal_year = fiscal_year,
    recipient_ft = recipient_ft, recipient_state = recipient_state, recipient_type = recipient_type,
    page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
