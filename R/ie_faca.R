#' Search for itemized Federal Advisory Committee memberships.
#'
#' @param affiliation (character) The name of the affiliated organization.
#' @param agency_name (character) The name of the agency associated with the committee.
#' @param committee_name (character) The name of the advisory committee.
#' @param member_name (character) Full-text search on the name of the affiliated organization.
#' @param year (integer) The YYYY-formatted year(s) the member sat on the committee.
#' @template ie
#' @return A data.frame, list, or httr response object
#' @export
#' @examples \dontrun{
#' ie_faca(member_name='Francis Collins', per_page=1)
#' ie_faca(agency_name='DOC', per_page=3)
#' ie_faca(affiliation='U.S. House of Representatives', per_page=3)
#' ie_faca(year=2011, per_page=1)
#' ie_faca(committee_name='2010 Census Advisory Committee', per_page=1)
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_faca(member_name = c('Francis Collins', 'Barbara Welty'))
#' ie_faca(agency_name = c('DOC', 'HHS'))
#' }

ie_faca <- function(affiliation = NULL, agency_name = NULL, committee_name = NULL, member_name = NULL,
  year = NULL, page = NULL, per_page = NULL, as = 'table', key = NULL, ...) {

  key <- check_key(key)
  args <- sc(list(apikey = key, affiliation = affiliation, agency_name = agency_name,
    committee_name = committee_name, member_name = member_name, year = year, page = page,
    per_page = per_page))
  give(as, ieurl(), "/faca.json", args, ...)
}
