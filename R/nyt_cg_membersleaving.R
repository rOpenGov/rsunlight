#' Get a list of members who have left the Senate or House or have announced plans to do so.
#' @import RJSONIO RCurl XML
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
#' nyt_cg_membersleaving(112, 'house')
#' }
nyt_cg_membersleaving <- 

function(congress_no = NA, chamber = NA, responseformat = 'json',
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, congress_no, '/', chamber, '/members/leaving.', responseformat, sep='')
  args <- list('api-key' = key)
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  if(responseformat == 'json') {fromJSON(tt)} else {xmlToList(tt)}
}
# http://api.nytimes.com/svc/politics/v3/us/legislative/congress/{congress-number}/{chamber}/members/leaving[.response-format]?api-key={your-API-key}