#' Lookup bills on OpenStates.
#'
#' @import httr
#' @importFrom stringr str_extract ignore.case
#' @template cg
#' @param state state two-letter abbreviation (character), required
#' @param session session of congress (integer), e.g., 2009-2010 = 20092010,
#'    required
#' @param bill_id One or more identification numbers of bills (character), required
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' os_billlookup(state='ca', session=20092010, bill_id='AB 667')
#' os_billlookup(state='ca', session=20092010, bill_id='SB 425')
#' tmp <- os_billlookup(state='ca', session=20092010, bill_id=c('AB 667','SB 425'))
#' tmp['AB 667']
#' tmp['SB 425']
#' }
os_billlookup <- function(state = NULL, session = NULL, bill_id = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  getdata <- function(x){
    url = "http://openstates.org/api/v1/bills"
    args <- suncompact(list(apikey=key, state=state, session=session, bill_id=x))
    tt <- GET(url, query=args, callopts)
    stop_for_status(tt)
    out <- content(tt, as = "text")
    fromJSON(out, simplifyVector = FALSE)
  }
  
  if(length(bill_id) > 1){
    res <- lapply(bill_id, getdata)
    names(res) <- bill_id
  } else { 
    res <- getdata(bill_id)
  }
  
  class(res) <- "os_billlookup"
  return( res )
}
