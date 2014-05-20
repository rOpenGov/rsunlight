#' Gets details (subcommittees + membership) for a committee by id.
#'  
#' Names, IDs, contact info, and memberships of committees and subcommittees in the House and 
#' Senate. All committee information is sourced from bulk data at github.com/unitedstates, which 
#' in turn comes from official House and Senate sources . Feel free to open a ticket with any 
#' bugs or suggestions. We only provide information on current committees and memberships. For 
#' historic data on committee names, IDs, and contact info, refer to the bulk data.
#' 
#' @import httr assertthat
#' @template cg
#' @param id committee id (eg. JSPR)
#' @return Committee details including subcommittees and all members.
#' @export
#' @examples \dontrun{
#' out <- cg_committees(member_ids='L000551')
#' out <- cg_committees(committee_id='SSAP')
#' out <- cg_committees(committee_id='SSAP', fields='members')
#' out <- cg_committees(chamber='joint', subcommittee=FALSE)
#' out <- cg_committees(parent_committee_id='HSWM')
#' sun_df(out)
#' 
#' # Disable pagination
#' out <- cg_committees(per_page='all')
#' sun_df(out)
#' }

cg_committees <-  function(member_ids = NULL, committee_id = NULL, chamber = NULL, 
  subcommittee = NULL, parent_committee_id = NULL, fields = NULL, page = NULL, per_page = NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list()) 
{
  if(!is.null(subcommittee))
    subcommittee <- ifelse(subcommittee, 'true', 'false')
  url = "https://congress.api.sunlightfoundation.com/committees"
  fields <- paste0(fields, collapse = ",")
  args <- suncompact(list(apikey = key, member_ids = member_ids, committee_id = committee_id, 
              chamber = chamber, subcommittee = subcommittee, fields = fields,
              parent_committee_id = parent_committee_id, page = page, per_page=per_page))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  class(res) <- "cg_committees"
#   message(sprintf("Found %s records", content(tt)$found))
#   class(tt) <- c("response","cg_committees")
#   class(tt) <- c("cg_committees","response")
  return( res )
}

# #' Print cg_committees output
# #' @export
# #' @param x Input from a cg_committees function call
# #' @param ... Further args, ignored.
# print.cg_committees <- function(x, ...){
# #   xx <- content(x)
#   query <- parse_url(x$url)
#   cat(sprintf("Call status: %s", x$status_code), "\n")
#   cat("First few query parameters:", "\n")
#   for(i in seq_along(query$query[1:length(query$query)])){
#     cat(sprintf("  %s = %s", names(query$query)[i], query$query[[i]]), "\n")
#   }
#   cat(sprintf("Found %s records", content(x)$count))
# }