#' @param title Title held by this legislator, either Sen or Rep
#' @param firstname Legislator's first name
#' @param middlename Legislator's middle name or initial
#' @param lastname Legislator's last name
#' @param name_suffix Legislator's suffix (Jr., III, etc.)
#' @param nickname Preferred nickname of legislator (if any)
#' @param party Legislator's political party (D, I, or R)
#' @param state two letter abbreviation of legislator's state
#' @param district If legislator is a representative, their district. 0 is used 
#'    for At-Large districts
#' @param in_office 1 if legislator is currently serving, 0 if legislator is no 
#'    longer in office due to defeat/resignation/death/etc.
#' @param gender M or F
#' @param phone Congressional office phone number
#' @param fax Congressional office fax number
#' @param website URL of Congressional website
#' @param webform URL of web contact form
#' @param email Legislator's email address (if known)
#' @param congress_office Legislator's Washington DC Office Address
#' @param bioguide_id Legislator ID assigned by 
#'    http://bioguide.congress.gov/biosearch/biosearch.asp Congressional 
#'    Biographical Directory (also used by Washington Post/NY Times)
#' @param votesmart_id Legislator ID assigned by http://votesmart.org Project 
#'    Vote Smart
#' @param fec_id http://fec.gov Federal Election Commission ID
#' @param govtrack_id ID assigned by http://govtrack.us Govtrack.us
#' @param crp_id ID provided by http://opensecrets.org Center for Responsive 
#'    Politics
#' @param congresspedia_url URL of Legislator's entry on http://congresspedia.org 
#'    Congresspedia
#' @param twitter_id Congressperson's official http://twitter.com Twitter 
#'    account
#' @param youtube_url Congressperson's official http://youtube.com Youtube 
#'    account
#' @param facebook_id Facebook ID, if the legislator has a username then 
#'    http://facebook.com/facebook_id will work, some users only have numeric 
#'    ids in which case to get their URL you'll need to visit 
#'    http://graph.facebook.com/facebook_id to get the URL (this graph url 
#'    should work for all users)
#' @param senate_class for senators I, II, or III depending on the Senator's 
#'    election term
#' @param birthdate YYYY-MM-DD formatted birth date
#' @details Currently the Sunlight Labs API provides two methods for obtaining 
#'    information about legislators: sll_cg_getlegislator and 
#'    sll_cg_getlegislatorlist. Both of these methods operate in essentially 
#'    the same way, the main difference being that sll_cg_getlegislator returns 
#'    a single legislator (or an error if the query would have resulted in 
#'    multiple legislators) and sll_cg_getlegislatorlist returns a list of 
#'    legislators (a list of size one is allowed). In other words, 
#'    sll_cg_getlegislator is purely a convenience method to avoid dealing with 
#'    a list of values when only one value is needed.