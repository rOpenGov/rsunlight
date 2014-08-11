#' Search for itemized campaign contributions
#' 
#' Search for itemized campaign contributions at the federal (FEC) or state (NIMSP) level.
#' 
#' @import httr
#' @param amount The amount of the contribution in US dollars in one of the following formats: 
#' 500 (exactly 500 dollars), >|500 (greater than or equal to 500 dollars), <|500 (less than or 
#' equal to 500 dollars)
#' @param contributor_ft Full-text search on name of individual, PAC, organization, or employer.
#' @param contributor_state Two-letter abbreviation of state from which the contribution was made.
#' @param cycle A YYYY formatted year (1990 - 2010) as a single year or YYYY|YYYY for an OR logic.
#' @param date date of the contribution in ISO date format (with ><|2006-08-06|2006-09-12 as a 
#' between-dates search).
#' @param for_against Either \dQuote{for} or \dQuote{against}. When organizations run ads against 
#' a candidate, they are counted as independent expenditures with the candidate as the recipient. 
#' This parameter can be used to filter contributions meant for the candidate and those meant to 
#' be against the candidate.
#' @param organization_ft Full-text search on employer, organization, and parent organization.
#' @param recipient_ft Full-text search on name of PAC or candidate receiving the contribution.
#' @param recipient_state Two-letter abbreviation of state in which the candidate receiving the 
#' contribution is running.
#' @param seat Type of office being sought: \dQuote{federal:senate}, \dQuote{federal:house}, 
#' \dQuote{federal:president}, \dQuote{state:upper}, \dQuote{state:lower}, or 
#' \dQuote{state:governor}. Use a pipe to separate multiple offices for an OR logic.
#' @param transaction_namespace Filters on federal or state contributions: 
#' \dQuote{urn:fec:transaction} (federal) or \dQuote{urn:nimsp:transaction} (state).
#' @template ie
#' @return Details on campaign contributions.
#' @export
#' @examples \dontrun{
#' ie_contr(amount='<|100')
#' ie_contr(amount='<|100', page=1, per_page=3)
#' ie_contr(recipient_state='al', for_against='for', amount='<|20')
#' }

ie_contr <-  function(
    amount = NULL,
    contributor_ft = NULL,
    contributor_state = NULL,
    cycle = NULL,
    date = NULL,
    for_against = NULL,
    organization_ft = NULL,
    recipient_ft = NULL,
    recipient_state = NULL,
    seat = NULL,
    transaction_namespace = NULL,
    page = NULL,
    per_page = NULL, return='table',
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...) 
{
  url <- "http://transparencydata.com/api/1.0/contributions.json"
  args <- suncompact(list(apikey = key, amount = amount,
    contributor_ft = contributor_ft, contributor_state = contributor_state, cycle = cycle,
    date = date, for_against = for_against, organization_ft = organization_ft,
    recipient_ft = recipient_ft, recipient_state = recipient_state, seat = seat,
    transaction_namespace = transaction_namespace, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
