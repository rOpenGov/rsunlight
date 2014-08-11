#' Get lobbying details
#' 
#' @import httr
#' @template ie
#' @param amount A YYYY formatted year (1990 - 2010) as a single year or YYYY|YYYY for an OR logic.
#' @param client_ft Full-text search on the name of the client for which the lobbyist is working.
#' @param client_parent_ft Full-text search on the name of the parent organization of the client.
#' @param filing_type Type of filing as identified by CRP. See \url{http://data.influenceexplorer.com/api/lobbying/}.
#' @param lobbyist_ft Full-text search on the name of the lobbyist involved in the lobbying activity.
#' @param registrant_ft Full-text search on the name of the person or organization filing the lobbyist registration. This is typically the firm that employs the lobbyists. Use the registrant_is_firm field to filter on firms v. individuals.
#' @param transaction_id Report ID given by the Senate Office of Public Records.
#' @param transaction_type The type of filing as reported by the Senate Office of Public Records. See \url{http://assets.transparencydata.org.s3.amazonaws.com/docs/transaction_types-20100402.csv}.
#' @param year A YYYY formatted year (1990 - 2010) as a single year or YYYY|YYYY for an OR logic.
#' @return Details on lobbying.
#' @export
#' @examples \dontrun{
#' ie_lobbying(registrant_ft='Patton Boggs', year=2012, per_page=1)
#' }
ie_lobbying <-  function(
    amount = NULL,
    client_ft = NULL,
    client_parent_ft = NULL,
    filing_type = NULL,
    lobbyist_ft = NULL,
    registrant_ft = NULL,
    transaction_id = NULL,
    transaction_type = NULL,
    year = NULL,
    page = NULL,
    per_page = NULL, return='table',
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...) 
{
  url <- "http://transparencydata.com/api/1.0/lobbying.json"
  args <- suncompact(list(apikey = key, amount = amount,
    client_ft = client_ft, client_parent_ft = client_parent_ft, filing_type = filing_type,
    lobbyist_ft = lobbyist_ft, registrant_ft = registrant_ft, transaction_id = transaction_id,
    transaction_type = transaction_type, year = year, page = page, per_page = per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
