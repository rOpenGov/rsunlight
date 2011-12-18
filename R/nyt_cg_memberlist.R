#' Get a list of members of a particular chamber in a particular Congress.
#' @import RJSONIO RCurl XML
#' @param congress_no The number of the Congress during which the members served.
#' @param chamber One of 'house' or 'senate.
#' @param state Limits the list of members by state; two-letter state code (e.g., CA).
#' @param district Limits the list of members by district (House only). If you specify
#'    a district, you must also specify a state. If the district number you 
#'    specify is higher than the total number of districts for that state, 
#'    a 404 response will be returned.
#' @param responseformat 'xml' or 'json'. 
#' @param url the NYT API url for the function (should be left to default). 
#' @param key your NYT Congress API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return List of members of a particular chamber in a particular Congress.
#' @export
#' @examples \dontrun{
#' nyt_cg_memberslist(112, 'senate')
#' nyt_cg_memberslist(112, 'senate', 'NH')
#' nyt_cg_memberslist(110, 'senate', 'NH', responseformat='xml')
#' }
nyt_cg_memberslist <- 

function(congress_no = NA, chamber = NA, state = NA, district = NA,
    responseformat = 'json',
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, congress_no, '/', chamber, '/members.', responseformat, sep='')
  args <- list('api-key' = key)
  if(!is.na(state))
    args$state <- state
  if(!is.na(district))
    args$district <- district
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  if(responseformat == 'json') {fromJSON(tt)} else {xmlToList(tt)}
}