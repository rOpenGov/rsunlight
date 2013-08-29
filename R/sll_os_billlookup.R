#' Lookup bills on OpenStates.
#' 
#' @import httr 
#' @importFrom stringr str_extract
#' @template cg
#' @param state state two-letter abbreviation (character), required
#' @param session session of congress (integer), e.g., 2009-2010 = 20092010, 
#'    required
#' @param billid identification number of bill (character), required
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_os_billlookup(state='ca', session=20092010, billid='AB667')
#' }
sll_os_billlookup <- function(state = NULL, session = NULL, billid = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url = "http://openstates.org/api/v1/bills/"
  billid_ <- paste(str_extract(billid, ignore.case('[a-z]+')), 
      '%20', str_extract(billid, '[0-9]+'), sep = "")
  urlget <- paste(url, state, '/', session, '/', billid_, sep='')
  args <- list(apikey=key)
  content(GET(urlget, query=args, callopts))
}