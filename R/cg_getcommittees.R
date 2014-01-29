#' Gets details (subcommittees + membership) for a committee by id.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @param id committee id (eg. JSPR)
#' @return Committee details including subcommittees and all members.
#' @export
#' @examples \dontrun{
#' cg_getcommittees(id = 'JSPR')
#' }
cg_getcommittees <-  function(id = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list()) 
{
  url = "http://services.sunlightlabs.com/api/committees.get.json"
  args <- compact(list(apikey = key, id = id))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  content(tt)
}