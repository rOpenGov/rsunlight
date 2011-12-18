#' Search OpenStates bills.
#' @import RJSONIO RCurl
#' @param title Title held by this legislator, either Sen or Rep
#' @param firstname Legislator's first name
#' @param middlename Legislator's middle name or initial
#' @param lastname Legislator's last name
#' @param name_suffix Legislator's suffix (Jr., III, etc.)
#' @param nickname Preferred nickname of legislator (if any)
#' @param party Legislator's political party (D, I, or R)
#' @param state two letter abbreviation of legislator's state
#' @param district If legislator is a representative, their district. 0 is used for At-Large districts
#' @param in_office 1 if legislator is currently serving, 0 if legislator is no longer in office due to defeat/resignation/death/etc.
#' @param gender M or F
#' @param phone Congressional office phone number
#' @param fax Congressional office fax number
#' @param website URL of Congressional website
#' @param webform URL of web contact form
#' @param email Legislator's email address (if known)
#' @param congress_office Legislator's Washington DC Office Address
#' @param bioguide_id Legislator ID assigned by [http://bioguide.congress.gov/biosearch/biosearch.asp Congressional Biographical Directory] (also used by Washington Post/NY Times)
#' @param votesmart_id Legislator ID assigned by [http://votesmart.org Project Vote Smart]
#' @param fec_id [http://fec.gov Federal Election Commission] ID
#' @param govtrack_id ID assigned by [http://govtrack.us Govtrack.us]
#' @param crp_id ID provided by [http://opensecrets.org Center for Responsive Politics]
#' @param congresspedia_url URL of Legislator's entry on [http://congresspedia.org Congresspedia]
#' @param twitter_id Congressperson's official [http://twitter.com Twitter] account
#' @param youtube_url Congressperson's official [http://youtube.com Youtube] account
#' @param facebook_id Facebook ID, if the legislator has a username then http://facebook.com/facebook_id will work, some users only have numeric ids in which case to get their URL you'll need to visit http://graph.facebook.com/facebook_id to get the URL (this graph url should work for all users)
#' @param senate_class for senators I, II, or III depending on the Senator's election term
#' @param birthdate YYYY-MM-DD formatted birth date
#' @param url the PLoS API url for the function (should be left to default)
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' sll_cg_getlegislator(lastname = 'Pelosi')
#' }
sll_cg_getlegislator <- 

function(title=NA, firstname=NA, middlename=NA, lastname=NA, name_suffix=NA, 
    nickname=NA, party=NA, state=NA, district=NA, in_office=NA, gender=NA, 
    phone=NA, fax=NA, website=NA, webform=NA, email=NA, congress_office=NA, 
    bioguide_id=NA, votesmart_id=NA, fec_id=NA, govtrack_id=NA, crp_id=NA, 
    congresspedia_url=NA, twitter_id=NA, youtube_url=NA, facebook_id=NA,
    senate_class=NA, birthdate=NA, url = "http://services.sunlightlabs.com/api/legislators.get.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ...,
    curl = getCurlHandle() ) 
{
  args <- list(apikey = key)
  if(!is.na(title))
    args$title <- title
  if(!is.na(firstname))
    args$firstname <- firstname
  if(!is.na(middlename))
    args$middlename <- middlename
  if(!is.na(lastname))
    args$lastname <- lastname
  if(!is.na(name_suffix))
    args$name_suffix <- name_suffix
  if(!is.na(nickname))
    args$nickname <- nickname
  if(!is.na(party))
    args$party <- party
  if(!is.na(state))
    args$state <- state
  if(!is.na(district))
    args$district <- district
  if(!is.na(in_office))
    args$in_office <- in_office
  if(!is.na(gender))
    args$gender <- gender
  if(!is.na(phone))
    args$phone <- phone
  if(!is.na(fax))
    args$fax <- fax
  if(!is.na(nickname))
    args$nickname <- nickname
  if(!is.na(website))
    args$website <- website
  if(!is.na(webform))
    args$webform <- webform
  if(!is.na(email))
    args$email <- email
  if(!is.na(congress_office))
    args$congress_office <- congress_office
  if(!is.na(bioguide_id))
    args$bioguide_id <- bioguide_id
  if(!is.na(votesmart_id))
    args$votesmart_id <- votesmart_id
  if(!is.na(fec_id))
    args$fec_id <- fec_id
  if(!is.na(govtrack_id))
    args$govtrack_id <- govtrack_id
  if(!is.na(crp_id))
    args$crp_id <- crp_id
  if(!is.na(congresspedia_url))
    args$congresspedia_url <- congresspedia_url
  if(!is.na(twitter_id))
    args$twitter_id <- twitter_id
  if(!is.na(youtube_url))
    args$youtube_url <- youtube_url
  if(!is.na(facebook_id))
    args$facebook_id <- facebook_id
  if(!is.na(senate_class))
    args$senate_class <- senate_class
  if(!is.na(birthdate))
    args$birthdate <- birthdate
  tt <- getForm(url, 
    .params = args, 
#      ..., 
    curl = curl)
  fromJSON(tt)
}