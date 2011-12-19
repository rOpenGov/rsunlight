#' Get a specific roll-call vote, including a complete list of member positions.
#' @import RJSONIO RCurl XML
#' @param congress_no The number of the Congress during which the members served.
#' @param chamber One of 'house' or 'senate.
#' @param session_no 1, 2, or special session number (For a detailed list of 
#'    Congressional sessions, see 
#'    http://www.senate.gov/reference/resources/pdf/congresses2.pdf).
#' @param rollcall_no Integer. To get roll-call numbers, see the official sites 
#'    of the US Senate (http://www.senate.gov/pagelayout/legislative/a_three_sections_with_teasers/votes.htm), 
#'    and US House (http://artandhistory.house.gov/house_history/index.aspx).
#' @param responseformat 'xml' or 'json'. 
#' @param url the NYT API url for the function (should be left to default). 
#' @param key your NYT Congress API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return Get a specific roll-call vote, including a complete list of member positions. 
#' @export
#' @examples \dontrun{
#' nyt_cg_rollcallvote(112, 'house', 1, 00235)
#' }
nyt_cg_rollcallvote <- 

function(congress_no = NA, chamber = NA, session_no = NA, rollcall_no = NA,
    responseformat = 'json',
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, congress_no, '/', chamber, '/sessions/', session_no, 
                '/votes/', rollcall_no, '.', responseformat, sep='')
  args <- list('api-key' = key)
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  if(responseformat == 'json') {fromJSON(tt)} else {xmlToList(tt)}
}

# http://api.nytimes.com/svc/politics/{version}/us/legislative/congress/{congress-number}/{chamber}/sessions/{session-number}/votes/{roll-call-number}[.response-format]?api-key={your-API-key}