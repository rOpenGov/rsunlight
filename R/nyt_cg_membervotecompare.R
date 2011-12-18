#' Get a list of members who have left the Senate or House or have announced plans to do so.
#' @import RJSONIO RCurl XML
#' @param memberid The member's unique ID number (alphanumeric). To find a 
#'    member's ID number, get the list of members for the appropriate House 
#'    or Senate. You can also use the Biographical Directory of the United 
#'    States Congress to get a member's ID. In search results, each member's 
#'    name is linked to a record by index ID (e.g., 
#'    http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041). 
#'    Use the index ID as member-id in your request.
#' @param congress_no The number of the Congress during which the members served.
#' @param chamber One of 'house' or 'senate.
#' @param responseformat 'xml' or 'json'. 
#' @param url the NYT API url for the function (should be left to default). 
#' @param key your NYT Congress API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return List of new members of he current Congress.
#' @export
#' @examples \dontrun{
#' nyt_cg_membervotecompare('S001181', 'A000368', 112, 'senate')
#' }
nyt_cg_membervotecompare <- 

function(memberid_1 = NA, memberid_2 = NA, congress_no = NA, chamber = NA, 
    responseformat = 'json',
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, memberid_1, '/votes/', memberid_2, '/',
                congress_no, '/', chamber, '.', responseformat, sep='')
  args <- list('api-key' = key)
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  if(responseformat == 'json') {fromJSON(tt)} else {xmlToList(tt)}
}
# http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/{first-member-id}/votes/{second-member-id}/{congress-number}/{chamber}[.response-format]?api-key={your-API-key}