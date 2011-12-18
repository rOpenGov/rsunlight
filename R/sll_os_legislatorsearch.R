#' Search Legislators on OpenStates. 
#' @import RJSONIO RCurl
#' @param state state two-letter abbreviation (character)
#' @param firstname first name of legislator (character)
#' @param lastname last name of legislator (character)
#' @param chamber one of 'upper' or 'lower' (character)
#' @param active TRUE or FALSE (character)
#' @param term filter by legislators who served during a certain term (character)
#' @param district legislative district (character)
#' @param party democratic or republican (character)
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_legislatorsearch(state = 'ca', party = 'democratic')
#' sll_os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
#' }
sll_os_legislatorsearch <- 
  
function(state = NA, firstname = NA, lastname = NA, chamber = NA, 
    active = NA, term = NA, district = NA, party = NA,
    url = "http://openstates.org/api/v1/legislators/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(state))
    args$state <- state
  if(!is.na(firstname))
    args$first_name <- firstname
  if(!is.na(lastname))
    args$last_name <- lastname    
  if(!is.na(chamber))
    args$chamber <- chamber
  if(!is.na(active))
    args$active <- active
  if(!is.na(term))
    args$term <- term
  if(!is.na(district))
    args$distict <- district
  if(!is.na(party))
    args$party <- party
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}