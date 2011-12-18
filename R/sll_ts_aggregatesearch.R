#' Search for entities - that is, politicians, individuals, or organizations--
#'    with the given name.
#' @import RJSONIO RCurl
#' @param search The query string. Spaces should be URL-encoded or represented 
#'    as +. There are no logic operators or grouping.
#' @param url the Sunlight Labs API url for the function
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'    the returned value in here (avoids unnecessary footprint)
#' @return Basic information about the the contributions to and from each 
#'    entity, as well as an ID that can be used in other API methods to 
#'    retrieve more information.
#' @export
#' @examples \dontrun{
#' sll_ts_aggregatesearch('Nancy Pelosi')
#' }
sll_ts_aggregatesearch <- 

function(search = NA,
    url = "http://transparencydata.com/api/1.0/entities.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(search))
    args$search <- search
  tt <- getForm(url, 
    .params = args, 
     ..., 
    curl = curl)
  fromJSON(tt)
}