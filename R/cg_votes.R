#' Search for data on votes.
#'
#' @export
#'
#' @param roll_id A unique identifier for a roll call vote. Made from the first letter of the
#' chamber, the vote number, and the legislative year.
#' @param chamber The chamber the vote was taken in. 'house' or 'senate'
#' @param number The number that vote was assigned. Numbers reset every legislative year.
#' @param year The 'legislative year' of the vote. This is not quite the same as the calendar year
#' - the legislative year changes at noon EST on January 3rd. A vote taken on January 1, 2013 has
#' a 'legislative year' of 2012.
#' @param congress The Congress this vote was taken in.
#' @param voted_at The time the vote was taken.
#' @param vote_type The type of vote being taken. This classification is imperfect and unofficial,
#' and may change as we improve our detection. Valid types are 'passage', 'cloture', 'nomination',
#' 'impeachment', 'treaty', 'recommit', 'quorum', 'leadership', and 'other'.
#' @param roll_type The official description of the type of vote being taken.
#' @param required The required ratio of Aye votes necessary to pass the legislation. A value of
#' '1/2' actually means more than 1/2. Ties are not possible in the Senate (the Vice President
#' casts a tie-breaker vote), and in the House, a tie vote means the vote does not pass.
#' @param result The official result of the vote. This is not completely standardized (both
#' 'Passed' and 'Bill Passed' may appear). In the case of a vote for Speaker of the House, the
#' result field contains the name of the victor.
#' @param bill_id If a vote is related to a bill, the bill's ID.
#' @param nomination_id If a vote is related to a nomination, the nomination's ID.
#' @param breakdown.total.[vote] The number of members who cast [vote], where [vote] is a valid
#' vote as defined above.
#' @param breakdown.party.[party].[vote] The number of members of [party] who cast [vote],
#' where [party] is one of 'D', 'R', or 'I', and [vote] is a valid vote as defined above.
#'
#' @template cg
#' @template cg_query
#' @examples \dontrun{
#' cg_votes(chamber='senate', order='voted_at')
#' cg_votes(query='guns')
#' }
#' 
#' @examples \donttest{
#' cg_votes(voter_ids.A000055__exists=TRUE)
#' cg_votes(voted_at__gte=2013-07-02T4:00:00Z)
#' }

cg_votes <- function(roll_id=NULL, chamber=NULL, number=NULL, year=NULL, congress=NULL,
  voted_at=NULL, vote_type=NULL, roll_type=NULL, required=NULL, result=NULL, bill_id=NULL,
  nomination_id=NULL, breakdown.total=NULL, breadkdown.party=NULL,
  fields=NULL, page=1, per_page=20, order=NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), return='table',
   ...)
{
  url <- 'https://congress.api.sunlightfoundation.com/votes'
  args <- suncompact(list(apikey=key,roll_id=roll_id, chamber=chamber, number=number, year=year, 
      congress=congress, voted_at=voted_at, vote_type=vote_type, roll_type=roll_type, 
      required=required, result=result, bill_id=bill_id, nomination_id=nomination_id, 
      breakdown.total=breakdown.total, breadkdown.party=breadkdown.party,
      per_page=per_page, page=page, fields=fields, order=order))

  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')

  return <- match.arg(return, c('response','list','table','data.frame'))
  if(return=='response'){ tt } else {
    out <- content(tt, as = "text")
    res <- fromJSON(out, simplifyVector = FALSE)
    class(res) <- "cg_votes"
    if(return=='list') res else fromJSON(out)
  }
}
