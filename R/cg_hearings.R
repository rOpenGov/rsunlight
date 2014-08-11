#' Search for data on hearings
#'
#' @export
#'
#' @param committee_id (numeric) The ID of the committee holding the hearing.
#' @param occurs_at (numeric) The time the hearing will occur.
#' @param congress (numeric) The number of the Congress the committee hearing is taking place during.
#' @param chamber (character) The chamber ('house', 'senate', or 'joint') of the committee holding the hearing.
#' @param dc (logical) Whether the committee hearing is held in DC (TRUE) or in the field (FALSE).
#' @param bill_ids (numeric) The IDs of any bills mentioned by or associated with the hearing.
#' @param hearing_type (character) (House only) The type of hearing this is. Can be: 'Hearing', 
#' 'Markup', 'Business Meeting', 'Field Hearing'.
#'
#' @template cg
#' @template cg_query
#' @examples \dontrun{
#' cg_hearings(chamber='house', dc=TRUE)
#' cg_hearings(query='children')
#' }

cg_hearings <- function(committee_id=NULL, occurs_at=NULL, congress=NULL, chamber=NULL,
  dc=NULL, bill_ids=NULL, hearing_type=NULL, query=NULL, fields=NULL, page=1, per_page=20, order=NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), return='table', ...)
{
  url <- 'https://congress.api.sunlightfoundation.com/hearings'
  args <- suncompact(list(apikey=key, committee_id=committee_id, occurs_at=occurs_at, 
      congress=congress, chamber=chamber, dc=getdc(dc), bill_ids=bill_ids, 
      hearing_type=hearing_type, query=query, per_page=per_page, page=page, fields=fields, order=order))

  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}

getdc <- function(x){
  if(is.null(x)) NULL else if(x) 'true' else 'false'
}
