#' Organization aggregates: Search for contributions to politicians.
#'
#' @export
#' @param method (character) The query string. One of top_org, top_rec, pac_rec, party_breakdown,
#' level_breakdown, registrants, issues, bills, lobbyists, reg_clients, reg_issues, or reg_bills.
#' reg_lobbyists, reg_text, regulations_submitter, faca, fec_summary, .
#' @param entity_id (character) The transparencydata ID to look up.
#' @param cycle (character) Filter results to a particular type of entity. One of politician,
#' organization, individual or industry.
#' @param limit (integer) Limit number of records returned.
#' @template ie
#' @return A data.frame (default), list, or httr response object.
#'
#' @examples \dontrun{
#' # Top Organizations
#' ie_organizations(method='top_org', limit=1)
#'
#' # Top Recipients
#' ie_organizations(method='top_rec', entity_id='1b8fea7e453d4e75841eac48ff9df550', limit=2)
#'
#' # PAC Recipients
#' ie_organizations(method='pac_rec', entity_id='1b8fea7e453d4e75841eac48ff9df550', cycle=2002)
#'
#' # Party Breakdown
#' ie_organizations(method='party_breakdown', entity_id='1b8fea7e453d4e75841eac48ff9df550')
#'
#' # State/Federal (Level) Breakdown
#' ie_organizations(method='level_breakdown', entity_id='1b8fea7e453d4e75841eac48ff9df550')
#'
#' # Lobbing Registrants
#' ie_organizations(method='registrants', entity_id='9070ecd132f44963a369479e91950283')
#'
#' # Lobbying Issues
#' ie_organizations(method='issues', entity_id='9070ecd132f44963a369479e91950283', limit=3)
#'
#' # Bills
#' ie_organizations(method='bills', entity_id='9070ecd132f44963a369479e91950283')
#'
#' # Lobbyists
#' ie_organizations(method='lobbyists', entity_id='9070ecd132f44963a369479e91950283')
#'
#' # Registrant Clients
#' ie_organizations(method='reg_clients', entity_id='52a1620b2ff543ebb74718fbff742529')
#'
#' # Registrant Issues
#' ie_organizations(method='reg_issues', entity_id='52a1620b2ff543ebb74718fbff742529')
#'
#' # Registrant Bills
#' ie_organizations(method='reg_bills', entity_id='52a1620b2ff543ebb74718fbff742529')
#'
#' # Registrant Lobbyists
#' ie_organizations(method='reg_lobbyists', entity_id='52a1620b2ff543ebb74718fbff742529')
#'
#' # Mentions in Regulations
#' ie_organizations(method='reg_text', entity_id='721c64757c11435393edc49bb33d4c96')
#'
#' # Regulatory Comment Submissions
#' ie_organizations(method='regulations_submitter', entity_id='9070ecd132f44963a369479e91950283')
#'
#' # FACA Memberships
#' ie_organizations(method='faca', entity_id='52a1620b2ff543ebb74718fbff742529')
#'
#' # FEC Summary
#' ie_organizations(method='fec_summary', entity_id='52a1620b2ff543ebb74718fbff742529')
#' }

ie_organizations <- function(method = NULL, entity_id = NULL, cycle = NULL, limit = NULL,
  page = NULL, per_page = NULL, as = 'table', key = NULL, ...) {

  key <- check_key(key)
  urlsuffix <- switch(method,
    top_org = sprintf('orgs/top_%s.json', limit),
    top_rec = sprintf('org/%s/recipients.json', entity_id),
    pac_rec = sprintf('org/%s/recipient_pacs.json', entity_id),
    party_breakdown = sprintf('org/%s/recipients/party_breakdown.json', entity_id),
    level_breakdown = sprintf('org/%s/recipients/level_breakdown.json', entity_id),
    registrants = sprintf('org/%s/registrants.json', entity_id),
    issues = sprintf('org/%s/issues.json', entity_id),
    bills = sprintf('org/%s/bills.json', entity_id),
    lobbyists = sprintf('org/%s/lobbyists.json', entity_id),
    reg_clients = sprintf('org/%s/registrant/clients.json', entity_id),
    reg_issues = sprintf('org/%s/registrant/issues.json', entity_id),
    reg_bills = sprintf('org/%s/registrant/bills.json', entity_id),
    reg_lobbyists = sprintf('org/%s/registrant/lobbyists.json', entity_id),
    reg_text = sprintf('org/%s/regulations_text.json', entity_id),
    regulations_submitter = sprintf('org/%s/regulations_submitter.json', entity_id),
    faca = sprintf('org/%s/faca.json', entity_id),
    fec_summary = sprintf('org/%s/fec_summary.json', entity_id)
  )

  url <- sprintf('%s/aggregates/%s', ieurl(), urlsuffix)
  if (method == "top_org") limit <- NULL
  args <- sc(list(apikey = key, cycle = cycle, limit = limit))

  return_obj(as, query(url, args, ...))
}
