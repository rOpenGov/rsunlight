#' Search OpenStates bills.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @template getleg
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' cg_getlegislator(lastname = 'Pelosi')
#' }
cg_getlegislator <- function(title=NULL, firstname=NULL, middlename=NULL, 
    lastname=NULL, name_suffix=NULL, nickname=NULL, party=NULL, state=NULL, 
    district=NULL, in_office=NULL, gender=NULL, phone=NULL, fax=NULL, 
    website=NULL, webform=NULL, email=NULL, congress_office=NULL, 
    bioguide_id=NULL, votesmart_id=NULL, fec_id=NULL, govtrack_id=NULL, 
    crp_id=NULL, congresspedia_url=NULL, twitter_id=NULL, youtube_url=NULL, 
    facebook_id=NULL, senate_class=NULL, birthdate=NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url <- "http://services.sunlightlabs.com/api/legislators.get.json"
  args <- compact(list(apikey=key,title=title,firstname=firstname,
                       middlename=middlename,lastname=lastname,
                       name_suffix=name_suffix,nickname=nickname,party=party,
                       state=state,district=district,in_office=in_office,
                       gender=gender,phone=phone,fax=fax,nickname=nickname,
                       website=website,webform=webform,email=email,
                       congress_office=congress_office,bioguide_id=bioguide_id,
                       votesmart_id=votesmart_id,fec_id=fec_id,
                       govtrack_id=govtrack_id,crp_id=crp_id,
                       congresspedia_url=congresspedia_url,twitter_id=twitter_id,
                       youtube_url=youtube_url,facebook_id=facebook_id,
                       senate_class=senate_class,birthdate=birthdate))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  content(tt)
}