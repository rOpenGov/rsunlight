#' Search Legislators on OpenStates.
#'
#' @import httr
#' 
#' @param state state two-letter abbreviation (character)
#' @param first_name first name of legislator (character)
#' @param last_name last name of legislator (character)
#' @param chamber one of 'upper' or 'lower' (character)
#' @param active TRUE or FALSE (character)
#' @param term filter by legislators who served during a certain term (character)
#' @param district legislative district (character)
#' @param party democratic or republican (character)
#' @param fields You can request specific fields by supplying a vector of fields names. Many fields
#' are not returned unless requested. If you don't supply a fields parameter, you will get the
#' most commonly used subset of fields only. To save on bandwidth, parsing time, and confusion,
#' it's recommended to always specify which fields you will be using.
#' @param per_page Number of records to return. Default: 20. Max: 50.
#' @param page Page to return. Default: 1. You can use this in combination with the
#' per_page parameter to get more than the default or max number of results per page.
#' @param return (character) One of table (default), list, or response (httr response object)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Optional additional curl options (debugging tools mostly). See examples.
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_legislatorsearch(state = 'ca', party = 'democratic')
#' os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
#' os_legislatorsearch(state = 'nv', party = 'republican')
#' os_legislatorsearch(state = 'dc', chamber = 'upper')
#' 
#' os_legislatorsearch(state = 'ca', party = 'democratic', per_page=3)
#' }
os_legislatorsearch <- function(state = NULL, first_name = NULL,
    last_name = NULL, chamber = NULL, active = NULL, term = NULL, district = NULL,
    party = NULL, page=NULL, per_page=NULL, fields = NULL, return='table',
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...)
{
  url = "http://openstates.org/api/v1/legislators/"
  args <- suncompact(list(apikey = key, state = state, first_name = first_name,
                       last_name = last_name, chamber = chamber, active = active,
                       term = term, district = district, party = party, 
                       page=page, per_page=per_page, fields=paste(fields, collapse = ",")))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  return_obj(return, tt)
}
