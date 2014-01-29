#' Search for entities - that is, politicians, individuals, or organizations--
#'    with the given name.
#'    
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param search The query string. Spaces should be URL-encoded or represented 
#'    as +. There are no logic operators or grouping.
#' @return Basic information about the the contributions to and from each 
#'    entity, as well as an ID that can be used in other API methods to 
#'    retrieve more information.
#' @export
#' @examples \dontrun{
#' ts_aggregatesearch('Nancy Pelosi')
#' }
ts_aggregatesearch <- function(search = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list()) 
{
  url = "http://transparencydata.com/api/1.0/entities.json"
  args <- list(apikey = key, search = search)
  content(GET(url, query=args, callopts))
}