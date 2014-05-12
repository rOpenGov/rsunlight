#' @param title Title held by this legislator, either Sen or Rep
#' @param first_name Legislator's first name
#' @param middle_name Legislator's middle name or initial
#' @param last_name Legislator's last name
#' @param name_suffix Legislator's suffix (Jr., III, etc.)
#' @param nickname Preferred nickname of legislator (if any)
#' @param party Legislator's political party (D, I, or R)
#' @param state two letter abbreviation of legislator's state
#' @param state_name The full state name of the state this member represents.
#' @param state_rank (Senate only) The seniority of that Senator for that state. "junior" or 
#' "senior".
#' @param district If legislator is a representative, their district. 0 is used
#'    for At-Large districts
#' @param in_office 1 if legislator is currently serving, 0 if legislator is no
#'    longer in office due to defeat/resignation/death/etc.
#' @param chamber Chamber the member is in. One of "senate" or "house".
#' @param gender M or F
#' @param phone Congressional office phone number
#' @param fax Congressional office fax number
#' @param office Office number for the member's DC office.
#' @param website URL of Congressional website
#' @param contact_form URL of web contact form
#' @param email Legislator's email address (if known)
#' @param congress_office Legislator's Washington DC Office Address
#' @param bioguide_id Legislator ID assigned by
#'    http://bioguide.congress.gov/biosearch/biosearch.asp Congressional
#'    Biographical Directory (also used by Washington Post/NY Times)
#' @param ocd_id Identifier for this member across all countries and levels of government, as 
#' defined by the Open Civic Data project.
#' @param thomas_id Identifier for this member as it appears on THOMAS.gov and Congress.gov.
#' @param lis_id Identifier for this member as it appears on some of Congress' data systems (namely 
#' Senate votes).
#' @param crp_id Identifier for this member as it appears on Center for Responsive
#'    Politics OpenSecrets (http://opensecrets.org)
#' @param icpsr_id Identifier for this member as it is maintained by the Inter-university 
#' Consortium for Political and Social Research.
#' @param votesmart_id Legislator ID assigned by http://votesmart.org Project
#'    Vote Smart
#' @param fec_ids http://fec.gov Federal Election Commission ID
#' @param govtrack_id ID assigned by http://govtrack.us Govtrack.us
#' @param congresspedia_url URL of Legislator's entry on http://congresspedia.org
#'    Congresspedia
#' @param twitter_id The Twitter username for a member's official legislative account. This field 
#' does not contain the handles of campaign accounts.
#' @param youtube_id The YouTube username or channel for a member's official legislative account. 
#' This field does not contain the handles of campaign accounts. A few legislators use YouTube 
#' "channels" instead of regular accounts. These channels will be of the form channel/[id].
#' @param facebook_id The Facebook username or ID for a member's official legislative Facebook 
#' presence. ID numbers and usernames can be used interchangeably in Facebook's URLs and APIs. 
#' The referenced account may be either a Facebook Page or a user account.
#' @param senate_class for senators I, II, or III depending on the Senator's
#'    election term
#' @param term_start The date a member's current term started.
#' @param term_end The date a member's current term will end.
#' @param birthday YYYY-MM-DD formatted birth date
#'
#' @details Currently the Sunlight Labs API provides two methods for obtaining
#'    information about legislators: sll_cg_getlegislator and
#'    sll_cg_getlegislatorlist. Both of these methods operate in essentially
#'    the same way, the main difference being that sll_cg_getlegislator returns
#'    a single legislator (or an error if the query would have resulted in
#'    multiple legislators) and sll_cg_getlegislatorlist returns a list of
#'    legislators (a list of size one is allowed). In other words,
#'    sll_cg_getlegislator is purely a convenience method to avoid dealing with
#'    a list of values when only one value is needed.
#'
#' All social media account values can be turned into URLs by preceding them with the domain name 
#' of the service in question:
#' \itemize{
#'  \item http://twitter.com/[username]
#'  \item http://youtube.com/[username or channel ID]
#'  \item http://facebook.com/[username or ID]
#' }
#'
#' \bold{Note about zip codes from Sunlight Foundation (a direct quote):} "A zip code may intersect 
#' multiple Congressional districts, so locating by 
#' zip may return multiple representatives, and possibly more than 2 senators if the zip code 
#' crosses state borders. In general, we recommend against using zip codes to look up members of 
#' Congress. For one, it’s imprecise: a zip code can intersect multiple congressional districts. 
#' More importantly, zip codes are not shapes. They are lines (delivery routes), and treating them 
#' as shapes leads to inaccuracies."
