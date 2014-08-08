#' Gets details for bills.
#'
#' Data on bills in Congress goes back to 2009, and comes from a mix of sources:
#' \itemize{
#'  \item Scrapers at github.com/unitedstates for most data, including core status and history
#'  information.
#'  \item Bulk data at GPO’s FDSys for version information, and full text.
#'  \item The House’ MajorityLeader.gov and Senate Democrats’ official site for notices of upcoming
#'  debate.
#' }
#'
#' @import httr assertthat jsonlite
#' @export
#' @template cg
#' @param query Allows wildcards, quoting for phrases, and nearby word operators (full reference).
#' You can also retrieve highlighted excerpts, and all normal operators and filters.
#' @param bill_id The unique ID for this bill. Formed from the bill_type, number, and congress.
#' @param bill_type The type for this bill. For the bill “H.R. 4921”, the bill_type represents the
#' “H.R.” part. Bill types can be: hr, hres, hjres, hconres, s, sres, sjres, sconres.
#' @param number The number for this bill. For the bill “H.R. 4921”, the number is 4921.
#' @param congress The Congress in which this bill was introduced. For example, bills introduced in
#' the “111th Congress” have a congress of 111.
#' @param chamber The chamber in which the bill originated.
#' @param introduced_on The date this bill was introduced.
#' @param last_action_at The date or time of the most recent official action. In the rare case that
#' there are no official actions, this field will be set to the value of introduced_on.
#' @param last_vote_at The date or time of the most recent vote on this bill.
#' @param last_version_on The date the last version of this bill was published. This will be set to
#' the introduced_on date until an official version of the bill’s text is published.
#' @param highlight (logical) If TRUE, looks for words in query param close to each other.
#' @param history_active Whether this bill has had any action beyond the standard action all bills
#' get (introduction, referral to committee, sponsors’ introductory remarks). Only a small
#' percentage of bills get this additional activity.
#' @param history_active_at If this bill got any action beyond initial introduction, the date or
#' time of the first such action. This field will stay constant even as further action occurs. For
#' the time of the most recent action, look to the last_action_at field.
#' @param history_house_passage_result The result of the last time the House voted on passage. Only
#' present if this vote occurred. “pass” or “fail”.
#' @param history_house_passage_result_at The date or time the House last voted on passage. Only
#' present if this vote occurred.
#' @param history_senate_cloture_result The result of the last time the Senate voted on cloture.
#' Only present if this vote occurred. “pass” or “fail”.
#' @param history_senate_cloture_result_at The date or time the Senate last voted on cloture. Only
#' present if this vote occurred.
#' @param history_senate_passage_result The result of the last time the Senate voted on passage.
#' Only present if this vote occurred. “pass” or “fail”.
#' @param history_senate_passage_result_at The date or time the Senate last voted on passage. Only
#' present if this vote occurred.
#' @param history_vetoed Whether the bill has been vetoed by the President. Always present.
#' @param history_vetoed_at The date or time the bill was vetoed by the President. Only present if
#' this happened.
#' @param history_house_override_result The result of the last time the House voted to override a
#' veto. Only present if this vote occurred. “pass” or “fail”.
#' @param history_house_override_result_at The date or time the House last voted to override a veto.
#' Only present if this vote occurred.
#' @param history_senate_override_result The result of the last time the Senate voted to override a
#' veto. Only present if this vote occurred. “pass” or “fail”.
#' @param history_senate_override_result_at The date or time the Senate last voted to override a
#' veto. Only present if this vote occurred.
#' @param history_awaiting_signature Whether the bill is currently awaiting the President’s
#' signature. Always present.
#' @param history_awaiting_signature_since The date or time the bill began awaiting the President’s
#' signature. Only present if this happened.
#' @param history_enacted Whether the bill has been enacted into law. Always present.
#' @param history_enacted_at The date or time the bill was enacted into law. Only present if this
#' happened.
#' @param official_title The current official title of a bill. Official titles are sentences.
#' Always present. Assigned at introduction, and can be revised any time.
#' @param short_title The current shorter, catchier title of a bill. About half of bills get these,
#' and they can be assigned any time.
#' @param popular_title The current popular handle of a bill, as denoted by the Library of Congress.
#' They are rare, and are assigned by the LOC for particularly ubiquitous bills. They are
#' non-capitalized descriptive phrases. They can be assigned any time.
#' @param titles A list of all titles ever assigned to this bill, with accompanying data.
#' @param titles.as The state the bill was in when assigned this title.
#' @param titles.title The title given to the bill.
#' @param titles.type The type of title this is. “official”, “short”, or “popular”.
#' @param nicknames An array of common nicknames for a bill that don’t appear in official data.
#' These nicknames are sourced from a public dataset at unitedstates/bill-nicknames, and will only
#' appear for a tiny fraction of bills. In the future, we plan to auto-generate acronyms from bill
#' titles and add them to this array.
#' @param keywords A list of official keywords and phrases assigned by the Library of Congress.
#' These keywords can be used to group bills into tags or topics, but there are many of them (1,023
#' unique keywords since 2009, as of late 2012), and they are not grouped into a hierarchy. They
#' can be assigned or revised at any time after introduction.
#' @param summary An official summary written and assigned at some point after introduction by the
#' Library of Congress. These summaries are generally more accessible than the text of the bill,
#' but can still be technical. The LOC does not write summaries for all bills, and when they do
#' can assign and revise them at any time.
#' @param summary_short The official summary, but capped to 1,000 characters (and an ellipse).
#' Useful when you want to show only the first part of a bill’s summary, but don’t want to download
#' a potentially large amount of text.
#' @param urls An object with URLs for this bill’s landing page on Congress.gov, GovTrack.us, and
#' OpenCongress.org.
#' @param actions.type The type of action. Always present. Can be “action” (generic), “vote”
#' (passage vote), “vote-aux” (cloture vote), “vetoed”, “topresident”, and “enacted”. There can be
#' other values, but these are the only ones we support.
#' @param actions.acted_at The date or time the action occurred. Always present.
#' @param actions.text The official text that describes this action. Always present.
#' @param actions.committees A list of subobjects containing committee_id and name fields for any
#' committees referenced in an action. Will be missing if no committees are mentioned.
#' @param actions.references A list of references to the Congressional Record that this action
#' links to.
#' @param actions.chamber If the action is a vote, which chamber this vote occured in. “house” or
#' “senate”.
#' @param actions.vote_type If the action is a vote, this is the type of vote. “vote”, “vote2”,
#' “cloture”, or “pingpong”.
#' @param actions.how If the action is a vote, how the vote was taken. Can be “roll”, “voice”, or
#' “Unanimous Consent”.
#' @param actions.result If the action is a vote, the result. “pass” or “fail”.
#' @param actions.roll_id If the action is a roll call vote, the ID of the roll call.
#' @param last_action The most recent action.
#' @param sponsor_id The bioguide ID of the bill’s sponsoring legislator, if there is one. It is 
#' possible, but rare, to have bills with no sponsor.
#' @param sponsor An object with most simple legislator fields for the bill’s sponsor, if there is 
#' one.
#' @param cosponsor_ids An array of bioguide IDs for each cosponsor of the bill. Bills do not 
#' always have cosponsors.
#' @param cosponsors_count The number of active cosponsors of the bill.
#' @param cosponsors.sponsored_on When a legislator signed on as a cosponsor of the legislation.
#' @param cosponsors.legislator An object with most simple legislator fields for that cosponsor.
#' @param withdrawn_cosponsor_ids An array of bioguide IDs for each legislator who has withdrawn 
#' their cosponsorship of the bill.
#' @param withdrawn_cosponsors_count The number of withdrawn cosponsors of the bill.
#' @param withdrawn_cosponsors.withdrawn_on The date the legislator withdrew their cosponsorship of 
#' the bill.
#' @param withdrawn_cosponsors.sponsored_on The date the legislator originally cosponsored the bill.
#' @param withdrawn_cosponsors.legislator An object with most simple legislator fields for that 
#' withdrawn cosponsor.
#' @param committee_ids A list of IDs of committees related to this bill.
#' @param committees.activity A list of relationships that the committee has to the bill, as they 
#' appear on THOMAS.gov. The most common is “referral”, which means a committee has jurisdiction 
#' over this bill.
#' @param related_bill_ids A list of IDs of bills that the Library of Congress has declared 
#' “related”. Relations can be pretty loose, use this field with caution.
#' @param versions.bill_version_id The unique ID for this bill version. It’s the bill’s bill_id plus 
#' the version’s version_code.
#' @param versions.version_code The short-code for what stage the version of the bill is at.
#' @param versions.version_name The full name for the stage the version of the bill is at.
#' @param versions.urls A set of HTML, PDF, and XML links (when available) for the official 
#' permanent URL of a bill version’s text. Our full text search uses the text from the HTML version 
#' of a bill.
#' @param last_version Information for only the most recent version of a bill. Useful to limit the 
#' size of a request with partial responses.
#' @param upcoming.source_type Where this information is coming from. Currently, the only values 
#' are “senate_daily” or “house_daily”.
#' @param upcoming.range How precise this information is. “day”, “week”, or null. See more details 
#' on this field in the /upcoming_bills documentation.
#' @param upcoming.url An official reference URL for this information.
#' @param upcoming.chamber What chamber the bill is scheduled for debate in.
#' @param upcoming.congress What Congress this is occurring in.
#' @param upcoming.legislative_day The date the bill is scheduled for floor debate.
#' @param upcoming.context Some surrounding context of why the bill is scheduled. This is only 
#' present for Senate updates right now.
#' @param enacted_as.congress The Congress in which this bill was enacted into law.
#' @param enacted_as.law_type Whether the law is a public or private law. Most laws are public 
#' laws; private laws affect individual citizens. “public” or “private”.
#' @param enacted_as.number The number the law was assigned.
#' @param page Page to return.
#' @param per_page Numbere of results to return per page.
#'
#' @details
#' History: The history field includes useful flags and dates/times in a bill’s life. The above is
#' a real-life example of H.R. 3590 - not all fields will be present for every bill. Time fields
#' can hold either dates or times - Congress is inconsistent about providing specific timestamps.
#'
#' @return Committee details including subcommittees and all members.
#'
#' @examples \dontrun{
#' # Bill lookup (i.e., filter)
#' cg_bills(congress=113, history.enacted=TRUE)
#' cg_bills(history.active=TRUE, order='last_action_at')
#' cg_bills(sponsor.party='R', history.vetoed=TRUE)
#' cg_bills(enacted_as.law_type='private', order='history.enacted_at')
#' cg_bills(bill_type__in='hjres|sjres', history.house_passage_result__exists=TRUE,
#'    history.senate_passage_result__exists=TRUE)
#'
#' # Bill search
#' cg_bills(query='health care')
#' cg_bills(query='health care', history.enacted=TRUE)
#' cg_bills(query='freedom of information')
#' cg_bills(query='"freedom of information" accountab*')
#' cg_bills(query='transparency accountability'~5, highlight=TRUE)
#'
#' # Disable pagination
#' cg_bills(per_page='all')
#' }

cg_bills <- function(query = NULL, bill_id = NULL, bill_type = NULL, number = NULL,
  congress = NULL, chamber = NULL, introduced_on = NULL, last_action_at = NULL,
  last_vote_at = NULL, last_version_on = NULL, highlight = NULL, history.active = NULL,
  history.active_at = NULL, history.house_passage_result = NULL,
  history.house_passage_result_at = NULL, history.senate_cloture_result = NULL,
  history.senate_cloture_result_at = NULL, history.senate_passage_result = NULL,
  history.senate_passage_result_at = NULL, history.vetoed = NULL, history.vetoed_at = NULL,
  history.house_override_result = NULL, history.house_override_result_at = NULL,
  history.senate_override_result = NULL, history.senate_override_result_at = NULL,
  history.awaiting_signature = NULL, history.awaiting_signature_since = NULL,
  history.enacted = NULL, history.enacted_at = NULL,
  sponsor.party = NULL, order = NULL, enacted_as.law_type = NULL, bill_type__in = NULL,
  history.house_passage_result__exists = NULL, history.senate_passage_result__exists = NULL,
  page = 1, per_page = 20,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  return='table', ...)
{
  if(is.null(query)){
    url <- 'https://congress.api.sunlightfoundation.com/bills'
  } else {
    url <- 'https://congress.api.sunlightfoundation.com/bills/search'
  }
    args <- suncompact(list(apikey=key,query=query,bill_id=bill_id,bill_type=bill_type,
      number=number,congress=congress,chamber=chamber,introduced_on=introduced_on,
      last_action_at=last_action_at,last_vote_at=last_vote_at,last_version_on=last_version_on,
      highlight=highlight,history.active=ll(history.active), history.active_at=history.active_at,
      history.house_passage_result=history.house_passage_result,
      history.house_passage_result_at=history.house_passage_result_at,
      history.senate_cloture_result=history.senate_cloture_result,
      history.senate_cloture_result_at=history.senate_cloture_result_at,
      history.senate_passage_result=history.senate_passage_result,
      history.senate_passage_result_at=history.senate_passage_result_at,
      history.vetoed=ll(history.vetoed), history.vetoed_at=history.vetoed_at,
      history.house_override_result=history.house_override_result,
      history.house_override_result_at=history.house_override_result_at,
      history.senate_override_result=history.senate_override_result,
      history.senate_override_result_at=history.senate_override_result_at,
      history.awaiting_signature=ll(history.awaiting_signature),
      history.awaiting_signature_since=history.awaiting_signature_since,
      history.enacted=ll(history.enacted), history.enacted_at=history.enacted_at,
      sponsor.party=sponsor.party,order=order,enacted_as.law_type=enacted_as.law_type,
      bill_type__in=bill_type__in,
      history.house_passage_result__exists=history.house_passage_result__exists,
      history.senate_passage_result__exists=history.senate_passage_result__exists,
      page=page,per_page=per_page))

  tt <- GET(url, query=args, ...)
  warn_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  
  return <- match.arg(return, c('response','list','table','data.frame'))
  if(return=='response'){ tt } else {
    out <- content(tt, as = "text")
    res <- fromJSON(out, simplifyVector = FALSE)
    class(res) <- "cg_bills"
    if(return=='list') res else fromJSON(out)
  }
}

ll <- function(x) if(!is.null(x)){ if(x) tolower(x) else x }
