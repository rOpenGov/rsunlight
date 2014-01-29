#' Search OpenStates bills.
#' 
#' @import httr
#' @importFrom plyr compact
#' @template cg
#' @template getleg
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' cg_getlegislatorlist(lastname = list('Pelosi','Reed'))
#' }
cg_getlegislatorlist <- function(title=NULL, firstname=NULL, middlename=NULL, 
  lastname=NULL, name_suffix=NULL, nickname=NULL, party=NULL, state=NULL, 
  district=NULL, in_office=NULL, gender=NULL, phone=NULL, fax=NULL, 
  website=NULL, webform=NULL, email=NULL, congress_office=NULL, 
  bioguide_id=NULL, votesmart_id=NULL, fec_id=NULL, govtrack_id=NULL, 
  crp_id=NULL, congresspedia_url=NULL, twitter_id=NULL, youtube_url=NULL, 
  facebook_id=NULL, senate_class=NULL, birthdate=NULL,
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
  callopts = list())
{
  # A function to create a list of named elements
  mm <- function(x){
    if(!is.null(x)){
      if(length(x)==1)
      { 
        nn <- deparse(substitute(x))
        names(x) <- nn
        x
      } else
      {
        nn <- deparse(substitute(x))
        names(x) <- rep(nn, length(x))
        x
      }
    }
    else { NULL }
  }
  
  url = "http://services.sunlightlabs.com/api/legislators.getList.json"
  args <- compact(c(apikey=key,mm(title),mm(firstname),mm(middlename),
                    mm(lastname),mm(name_suffix),mm(nickname),mm(party),
                    mm(state),mm(district),mm(in_office),mm(gender),mm(phone),
                    mm(fax),mm(nickname),mm(website),mm(webform),mm(email),
                    mm(congress_office),mm(bioguide_id),mm(votesmart_id),
                    mm(fec_id),mm(govtrack_id),mm(crp_id),mm(congresspedia_url),
                    mm(twitter_id),mm(youtube_url),mm(facebook_id),
                    mm(senate_class),mm(birthdate)))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  content(tt)
}