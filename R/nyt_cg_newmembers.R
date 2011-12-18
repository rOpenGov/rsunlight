#' Get a list of the most recent new members of the current Congress.
#' @import RJSONIO RCurl XML
#' @param responseformat 'xml' or 'json'. 
#' @param url the NYT API url for the function (should be left to default). 
#' @param key your NYT Congress API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return List of new members of he current Congress.
#' @export
#' @examples \dontrun{
#' nyt_cg_newmembers()
#' }
nyt_cg_newmembers <- 

function(responseformat = 'json',
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/new",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ...,
    curl = getCurlHandle() ) 
{
  url2 <- paste(url, '.', responseformat, sep='')
  args <- list('api-key' = key)
  tt <- getForm(url2, 
    .params = args, 
     ..., 
    curl = curl)
  if(responseformat == 'json') {fromJSON(tt)} else {xmlToList(tt)}
}
# http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/new[.response-format]?api-key={your-API-key}