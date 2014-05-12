#' Search .
#'
#' @import httr
#' @template cg
#' @template getleg
#' 
#' @param latitude latitude of coordinate
#' @param longitude longitude of coordinate
#' 
#' @param zip zip code to search
#' 
#' @return List of output fields.
#' @export
#' @examples \dontrun{
#' out <- cg_legislators(last_name = 'Pelosi')
#' out <- cg_legislators(party = 'D')
#' out <- cg_legislators(twitter_id = 'SenRandPaul')
#' out <- cg_legislators(facebook_id = 'mitchmcconnell')
#' out <- cg_legislators(latitude = 35.778788, longitude = -78.787805)
#' sunlight_list(out)
#' out <- cg_legislators(zip = 77006)
#' }
cg_legislators <- function(title=NULL, first_name=NULL, middle_name=NULL,
    last_name=NULL, name_suffix=NULL, nickname=NULL, party=NULL, state=NULL,
    state_name=NULL, state_rank=NULL, district=NULL, in_office=NULL, chamber=NULL, 
    gender=NULL, phone=NULL, fax=NULL, office=NULL, website=NULL, contact_form=NULL, 
    email=NULL, congress_office=NULL, bioguide_id=NULL, ocd_id=NULL, thomas_id=NULL, 
    lis_id=NULL, crp_id=NULL, icpsr_id=NULL, votesmart_id=NULL, fec_ids=NULL, 
    govtrack_id=NULL, congresspedia_url=NULL, twitter_id=NULL, youtube_id=NULL,
    facebook_id=NULL, senate_class=NULL, term_start=NULL, term_end=NULL, birthday=NULL,
    latitude = NULL, longitude = NULL, zip = NULL,
    key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
{
  if(!is.null(latitude) | !is.null(latitude) | !is.null(zip)){
    url <- 'https://congress.api.sunlightfoundation.com/legislators/locate'
    assert_that(is.null(title),is.null(first_name),is.null(middle_name),is.null(last_name),
        is.null(name_suffix),is.null(nickname),is.null(party),is.null(state),is.null(state_name),
        is.null(state_rank),is.null(district),is.null(in_office),is.null(chamber),is.null(gender),
        is.null(phone),is.null(fax),is.null(office),is.null(website),is.null(contact_form),
        is.null(email),is.null(congress_office),is.null(bioguide_id),is.null(ocd_id),
        is.null(thomas_id),is.null(lis_id),is.null(crp_id),is.null(icpsr_id),is.null(votesmart_id),
        is.null(fec_ids),is.null(govtrack_id),is.null(congresspedia_url),is.null(twitter_id),
        is.null(youtube_id),is.null(facebook_id),is.null(senate_class),is.null(term_start),
        is.null(term_end),is.null(birthday))
    if(!is.null(latitude) & !is.null(latitude) & is.null(zip)){
      assert_that(is.null(zip))
      args <- suncompact(list(apikey=key,latitude=latitude,longitude=longitude))
    } else if(!is.null(zip)){
      assert_that(is.null(latitude),is.null(longitude))
      args <- suncompact(list(apikey=key,zip=zip))
    }
  } else {  
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
  }
  
  tt <- GET(url, query=args, callopts)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
#   out <- content(tt, as = "text")
#   res <- fromJSON(out, simplifyVector = FALSE)
#   res <- list(found = res$count, meta = res$page,
#               data = if(length(res$results) == 1){ res$results[[1]] } else { res$results } )
  message(sprintf("Found %s records", res$found))
  class(tt) <- c("response","cg_legislators")
  return( tt )
}

sunlight_list <- function(x){
  assert_that(is(x, "response"))
  out <- content(x, as = "text")
  res <- fromJSON(out, simplifyVector = FALSE)
  resout <- list(found = res$count, meta = res$page,
       data = if(length(res$results) == 1){ res$results[[1]] } else { res$results } )
  class(resout) <- class(x)[ !class(x) %in% "response" ]
  return( resout )
}

#' Write data from any rsunlight function output to a csv file on your machine.
#' 
#' @import assertthat
#' @export
#' @param x Output from any of the rsunlight functions.
#' @param ... Further args passed to read.csv
#' @details This function attemps to coerce the raw output from each rsunlight function to a 
#' data.frame to write to csv, but it may fail in some cases. You can always make your own 
#' data.frame. 
#' @examples \dontrun{
#' out <- cg_legislators(latitude = 35.778788, longitude = -78.787805)
#' sunlight_df(sunlight_list(out))
#' sunlight_df(out)
#' 
#' out <- cg_committees(member_ids='L000551')
#' sunlight_df(sunlight_list(out))
#' }
sunlight_df <- function(x, ...){
  UseMethod("sunlight_df")
}

sunlight_df.cg_legislators <- function(x){
  assert_that(typeof(x) == "list")
  if(x$found == 1){
    iter <- x$data
    df <- data.frame(iter, stringsAsFactors = FALSE)
  } else {
    iter <- x$data
    iter <- lapply(iter, replacemissing)
    df <- do.call(rbind.fill, lapply(iter, data.frame, stringsAsFactors = FALSE))
  }
  return( df )
}

sunlight_df.cg_committees <- function(x){
  assert_that(is(x, "cg_committees"))
  notmembers <- x$committee[!names(x$committee) %in% "members"]
  notmembers <- replacemissing(notmembers)
  members <- do.call(rbind.fill, lapply(x$committee$members, data.frame, stringsAsFactors = FALSE))
  cbind(notmembers, members)
}

replacemissing <- function(x){
  lapply(x, function(y){
    ifelse(length(y)==0, "", y)
  })
}