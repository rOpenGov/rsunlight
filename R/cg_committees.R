#' Gets details (subcommittees + membership) for a committee by id.
#'  
#' Names, IDs, contact info, and memberships of committees and subcommittees in the House and 
#' Senate. All committee information is sourced from bulk data at github.com/unitedstates, which 
#' in turn comes from official House and Senate sources . Feel free to open a ticket with any 
#' bugs or suggestions. We only provide information on current committees and memberships. For 
#' historic data on committee names, IDs, and contact info, refer to the bulk data.
#' 
#' @import httr
#' @template cg
#' @param id committee id (eg. JSPR)
#' @return Committee details including subcommittees and all members.
#' @export
#' @examples \dontrun{
#' cg_committees(member_ids='L000551')
#' cg_committees(committee_id='SSAP')
#' cg_committees(committee_id='SSAP', fields='members')
#' cg_committees(chamber='joint', subcommittee=FALSE)
#' cg_committees(chamber='joint', subcommittee=TRUE)
#' cg_committees(parent_committee_id='HSWM')
#' 
#' # Disable pagination
#' cg_committees(per_page='all')
#' }

cg_committees <-  function(member_ids = NULL, committee_id = NULL, chamber = NULL, 
  subcommittee = NULL, parent_committee_id = NULL, fields = NULL, page = NULL, per_page = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list()) 
{
  if(!is.null(subcommittee))
    subcommittee <- ifelse(subcommittee, 'true', 'false')
  url = "https://congress.api.sunlightfoundation.com/committees"
  args <- suncompact(list(apikey = key, member_ids = member_ids, committee_id = committee_id, 
              chamber = chamber, subcommittee = subcommittee, fields = fields,
              parent_committee_id = parent_committee_id, page = page, per_page=per_page))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
#   out <- content(tt, as = "text")
#   res <- fromJSON(out, simplifyVector = FALSE)$response
#   class(res) <- "cg_getcommittees"
  message(sprintf("Found %s records", res$found))
  class(tt) <- c("response","cg_committees")
  return( tt )
}