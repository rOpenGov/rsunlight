#' votes methods
#'
#' @export
#' @name votes
#' @param congress (character) The number of the Congress this update
#' took place during.
#' @param chamber (character) The chamber this update took place in.
#' 'house' or 'senate'.
#' @param session (integer) 1 or 2, depending on year (1 is odd-numbered
#' years, 2 is even-numbered years)
#' @param id (integer) roll call number, i.e., vote id
#' @param year (integer) a four digit year of the form YYYY
#' @param month (integer) a 1 or 2 digit month
#' @param start_date,end_date (character) start and end date, of the form
#' YYYY-MM-DD
#' @param votes (logical) whether to return votes data or not. default: `FALSE`
#' @param type (character) the vote type, one of missed, party, loneno or perfect
#' @param category attribute describing the general reason for the absence or
#' incorrect vote. see Details.
#' @param member_id (character) The ID of the member to retrieve; it is
#' assigned by the Biographical Directory of the United States Congress
#' (http://bioguide.congress.gov/biosearch/biosearch.asp) or can be retrieved
#' from a [cg_members()] request
#' @param key your ProPublica API key; pass in or loads from environment variable
#' stored as `PROPUBLICA_API_KEY` in either your .Renviron, or similar file
#' locatd in your home directory
#' @param as (character) IGNORED FOR NOW
#' @param ... optional curl options passed on to [crul::HttpClient].
#' See [curl::curl_options()]
#' @return various things for now, since return objects vary quite a bit
#' among the different votes routes
#' @section Categories for the `category` parameter:
#'
#' - voted-incorrectly: Voted yes or no by mistake
#' - official-business: Away on official congressional business
#' - ambiguous: No reason given
#' - travel-difficulties: Travel delays and issues
#' - personal:  Personal or family reason
#' - claims-voted:  Vote made but not recorded
#' - medical: Medical issue for lawmaker (not family)
#' - weather: Inclement weather
#' - memorial:  Attending memorial service
#' - misunderstanding:  Not informed of vote
#' - leave-of-absence:  Granted leave of absence
#' - prior-commitment:  Attending to prior commitment
#' - election-related:  Participating in an election
#' - military-service:  Military service
#' - other: Other
#'
#' @examples \dontrun{
#' cg_vote(115, "senate", 1, 17)
#' cg_votes_recent("senate")
#' cg_votes_type(114, "house", "missed")
#' cg_votes_date("senate", year = 2017, month = 1)
#' cg_votes_date("senate", year = 2017, month = 3)
#' cg_votes_date("senate", start_date = "2017-01-03", end_date = "2017-01-31")
#' cg_votes_senatenoms(114)
#' cg_votes_explanations(114, votes = FALSE)
#' cg_votes_explanations(114, votes = TRUE)
#' cg_votes_explanations_category(114, "voted-incorrectly")
#' cg_votes_explanations_member("S001193", 115, votes = FALSE)
#' cg_votes_explanations_member("S001193", 115, votes = TRUE)
#' cg_votes_explanations_member("S001193", 115, votes = TRUE,
#'  category = "personal")
#' }
cg_vote <- function(congress, chamber, session, id, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/%s/sessions/%s/votes/%s.json",
    congress, chamber, session, id)
  foo_bar(as, cgurl(), path, args = list(), key, TRUE)
}

#' @export
#' @rdname votes
cg_votes_recent <- function(chamber, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/votes/recent.json", chamber)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results$votes
}

#' @export
#' @rdname votes
cg_votes_type <- function(congress, chamber, type, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/%s/votes/%s.json", congress, chamber, type)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results[[1]]$members
}

#' @export
#' @rdname votes
cg_votes_date <- function(chamber, year = NULL, month = NULL, start_date = NULL,
  end_date = NULL, key = NULL, as = 'table', ...) {

  url_pattern <- "congress/v1/%s/votes/%s/%s.json"
  if (!is.null(year) && !is.null(month)
    && is.null(start_date) && is.null(end_date)) {
    path <- sprintf(url_pattern, chamber, year, sprintf("%02d", 1))
  } else if (is.null(year) && is.null(month)
    && !is.null(start_date) && !is.null(end_date)) {
    path <- sprintf(url_pattern, chamber, start_date, end_date)
  } else {
    stop("use only year/month or start_date/end_date combinations")
  }
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname votes
cg_votes_senatenoms <- function(congress, key = NULL, as = 'table', ...) {
  path <- sprintf("congress/v1/%s/nominations.json", congress)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results[[1]]$votes
}

#' @export
#' @rdname votes
cg_votes_explanations <- function(congress, votes = FALSE, key = NULL,
  as = 'table', ...) {

  if (votes) {
    path <- sprintf("congress/v1/%s/explanations/votes.json", congress)
  } else {
    path <- sprintf("congress/v1/%s/explanations.json", congress)
  }
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname votes
cg_votes_explanations_category <- function(congress, category, key = NULL,
  as = 'table', ...) {

  path <- sprintf("congress/v1/%s/explanations/votes/%s.json",
    congress, category)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname votes
cg_votes_explanations_member <- function(member_id, congress, key = NULL,
  as = 'table', ...) {

  path <- sprintf("congress/v1/members/%s/explanations/%s.json",
    member_id, congress)
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}

#' @export
#' @rdname votes
cg_votes_explanations_member <- function(member_id, congress, votes = FALSE,
  category = NULL, key = NULL, as = 'table', ...) {

  if (votes) {
    if (!is.null(category)) {
      path <- sprintf("congress/v1/members/%s/explanations/%s/votes/%s.json",
        member_id, congress, category)
    } else {
      path <- sprintf("congress/v1/members/%s/explanations/%s/votes.json",
        member_id, congress)
    }
  } else {
    if (!is.null(category)) warning("if votes=FALSE, category is ignored")
    path <- sprintf("congress/v1/members/%s/explanations/%s.json",
      member_id, congress)
  }
  foo_bar(as, cgurl(), path, args = list(), key, ...)$results
}
