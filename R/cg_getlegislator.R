#' Search OpenStates bills.
#'
#' @import httr
#' @template cg
#' @template getleg
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' cg_getlegislator(last_name = 'Pelosi')
#' cg_getlegislator(party = 'D')
#' cg_getlegislator(twitter_id = 'SenRandPaul')
#' cg_getlegislator(facebook_id = 'mitchmcconnell')
#' }
cg_getlegislator <- function(title=NULL, first_name=NULL, middle_name=NULL,
    last_name=NULL, name_suffix=NULL, nickname=NULL, party=NULL, state=NULL,
    state_name=NULL, state_rank=NULL, district=NULL, in_office=NULL, chamber=NULL, 
    gender=NULL, phone=NULL, fax=NULL, office=NULL, website=NULL, contact_form=NULL, 
    email=NULL, congress_office=NULL, bioguide_id=NULL, ocd_id=NULL, thomas_id=NULL, 
    lis_id=NULL, crp_id=NULL, icpsr_id=NULL, votesmart_id=NULL, fec_ids=NULL, 
    govtrack_id=NULL, congresspedia_url=NULL, twitter_id=NULL, youtube_id=NULL,
    facebook_id=NULL, senate_class=NULL, term_start=NULL, term_end=NULL, birthday=NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  url <- 'https://congress.api.sunlightfoundation.com/legislators'
  args <- suncompact(list(apikey=key,title=title,first_name=first_name,middle_name=middle_name,
        last_name=last_name,name_suffix=name_suffix,nickname=nickname,party=party,state=state,
        state_name=state_name,state_rank=state_rank,district=district,in_office=in_office,
        chamber=chamber,gender=gender,phone=phone,fax=fax,office=office,website=website,
        contact_form=contact_form,email=email,congress_office=congress_office,
        bioguide_id=bioguide_id,ocd_id=ocd_id,thomas_id=thomas_id,lis_id=lis_id,crp_id=crp_id,
        icpsr_id=icpsr_id,votesmart_id=votesmart_id,fec_ids=fec_ids,govtrack_id=govtrack_id,
        congresspedia_url=congresspedia_url,twitter_id=twitter_id,youtube_id=youtube_id,
        facebook_id=facebook_id,senate_class=senate_class,term_start=term_start,term_end=term_end,
        birthday=birthday))
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  out <- content(tt, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  res <- list(found = res$count, meta = res$page,
              data = if(length(res$results) == 1){ res$results[[1]] } else { res$results } )
  class(res) <- "cg_getlegislator"
  return( res )
}
