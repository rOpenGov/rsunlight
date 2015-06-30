#' Search itemized earmark requests through FY 2010.
#'
#' @param amount (integer) The final amount of the earmark.
#' @param bill (character) The bill, section or subsection of the earmark.
#' @param city (character) The city where the money will be spent.
#' @param description (character) Full-text search on the description of the earmark request.
#' @param member (character) Full-text search on the member of Congress requesting the earmark.
#' @param member_party (character) The party of the member requesting the earmark, D, R or I.
#' @param member_state (character) The 2-letter state abbreviation of the requesting member.
#' @param recipient (character) Full-text search on the intended recipient, when known.
#' @param year (character) The YYYY-formatted fiscal year for which the earmark was requested.
#' @template ie
#' @template earmarks
#' @return A data.frame (default), list, or httr response object
#' @export
#' @examples \dontrun{
#' ie_earmarks(year='2010', per_page=3)
#' ie_earmarks(city='New York City', per_page=1)
#' ie_earmarks(member='Nadler', per_page=1)
#' ie_earmarks(member_state='AK', per_page=3)
#' ie_earmarks(member_party='R', per_page=1)
#' ie_earmarks(description='Infantry Support')
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_earmarks(member_state = c('OR', 'WA'))
#' ie_earmarks(member_party = c('R', 'D'))
#' }

ie_earmarks <- function(amount = NULL, bill = NULL, city = NULL, description = NULL, member = NULL,
  member_party = NULL, member_state = NULL, recipient = NULL, year = NULL, page = NULL,
  per_page = NULL, as = 'table', key = NULL, ...) {

  key <- check_key(key)
  args <- sc(list(apikey = key, amount = amount, bill = bill, city = city,
    description = description, member = member, member_party = member_party,
    member_state = member_state, recipient = recipient, year = year, page = page,
    per_page = per_page))
  give(as, ieurl(), "/earmarks.json", args, ...)
}
