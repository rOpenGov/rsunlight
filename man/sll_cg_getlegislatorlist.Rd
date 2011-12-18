\name{sll_cg_getlegislatorlist}
\alias{sll_cg_getlegislatorlist}
\title{Search OpenStates bills.}
\usage{
  sll_cg_getlegislatorlist(title = NA, firstname = NA,
    middlename = NA, lastname = NA, name_suffix = NA,
    nickname = NA, party = NA, state = NA, district = NA,
    in_office = NA, gender = NA, phone = NA, fax = NA,
    website = NA, webform = NA, email = NA,
    congress_office = NA, bioguide_id = NA,
    votesmart_id = NA, fec_id = NA, govtrack_id = NA,
    crp_id = NA, congresspedia_url = NA, twitter_id = NA,
    youtube_url = NA, facebook_id = NA, senate_class = NA,
    birthdate = NA,
    url = "http://services.sunlightlabs.com/api/legislators.getList.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{title}{Title held by this legislator, either Sen or
  Rep}

  \item{firstname}{Legislator's first name}

  \item{middlename}{Legislator's middle name or initial}

  \item{lastname}{Legislator's last name}

  \item{name_suffix}{Legislator's suffix (Jr., III, etc.)}

  \item{nickname}{Preferred nickname of legislator (if
  any)}

  \item{party}{Legislator's political party (D, I, or R)}

  \item{state}{two letter abbreviation of legislator's
  state}

  \item{district}{If legislator is a representative, their
  district. 0 is used for At-Large districts}

  \item{in_office}{1 if legislator is currently serving, 0
  if legislator is no longer in office due to
  defeat/resignation/death/etc.}

  \item{gender}{M or F}

  \item{phone}{Congressional office phone number}

  \item{fax}{Congressional office fax number}

  \item{website}{URL of Congressional website}

  \item{webform}{URL of web contact form}

  \item{email}{Legislator's email address (if known)}

  \item{congress_office}{Legislator's Washington DC Office
  Address}

  \item{bioguide_id}{Legislator ID assigned by
  [http://bioguide.congress.gov/biosearch/biosearch.asp
  Congressional Biographical Directory] (also used by
  Washington Post/NY Times)}

  \item{votesmart_id}{Legislator ID assigned by
  [http://votesmart.org Project Vote Smart]}

  \item{fec_id}{[http://fec.gov Federal Election
  Commission] ID}

  \item{govtrack_id}{ID assigned by [http://govtrack.us
  Govtrack.us]}

  \item{crp_id}{ID provided by [http://opensecrets.org
  Center for Responsive Politics]}

  \item{congresspedia_url}{URL of Legislator's entry on
  [http://congresspedia.org Congresspedia]}

  \item{twitter_id}{Congressperson's official
  [http://twitter.com Twitter] account}

  \item{youtube_url}{Congressperson's official
  [http://youtube.com Youtube] account}

  \item{facebook_id}{Facebook ID, if the legislator has a
  username then http://facebook.com/facebook_id will work,
  some users only have numeric ids in which case to get
  their URL you'll need to visit
  http://graph.facebook.com/facebook_id to get the URL
  (this graph url should work for all users)}

  \item{senate_class}{for senators I, II, or III depending
  on the Senator's election term}

  \item{birthdate}{YYYY-MM-DD formatted birth date}

  \item{url}{the PLoS API url for the function (should be
  left to default)}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  List of output fields.
}
\description{
  Search OpenStates bills.
}
\examples{
\dontrun{
sll_cg_getlegislatorlist(lastname = list('Pelosi','Reed'))
}
}

