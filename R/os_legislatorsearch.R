#' Search Legislators on OpenStates.
#'
#' @import httr
#' @template cg
#' @param state state two-letter abbreviation (character)
#' @param firstname first name of legislator (character)
#' @param lastname last name of legislator (character)
#' @param chamber one of 'upper' or 'lower' (character)
#' @param active TRUE or FALSE (character)
#' @param term filter by legislators who served during a certain term (character)
#' @param district legislative district (character)
#' @param party democratic or republican (character)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_legislatorsearch(state = 'ca', party = 'democratic')
#' os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
#' }
os_legislatorsearch <- function(state = NULL, firstname = NULL,
    lastname = NULL, chamber = NULL, active = NULL, term = NULL, district = NULL,
    party = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://openstates.org/api/v1/legislators/"
  args <- suncompact(list(apikey = key, state = state, firstname = firstname,
                       lastname = lastname, chamber = chamber, active = active,
                       term = term, district = district, party = party))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  class(res) <- "os_legislatorsearch"
  return( res )
}
