\name{sll_cg_getlegislator}
\alias{sll_cg_getlegislator}
\title{Search OpenStates bills.}
\usage{
  sll_cg_getlegislator(title = NULL, firstname = NULL,
    middlename = NULL, lastname = NULL, name_suffix = NULL,
    nickname = NULL, party = NULL, state = NULL,
    district = NULL, in_office = NULL, gender = NULL,
    phone = NULL, fax = NULL, website = NULL,
    webform = NULL, email = NULL, congress_office = NULL,
    bioguide_id = NULL, votesmart_id = NULL, fec_id = NULL,
    govtrack_id = NULL, crp_id = NULL,
    congresspedia_url = NULL, twitter_id = NULL,
    youtube_url = NULL, facebook_id = NULL,
    senate_class = NULL, birthdate = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

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
  http://bioguide.congress.gov/biosearch/biosearch.asp
  Congressional Biographical Directory (also used by
  Washington Post/NY Times)}

  \item{votesmart_id}{Legislator ID assigned by
  http://votesmart.org Project Vote Smart}

  \item{fec_id}{http://fec.gov Federal Election Commission
  ID}

  \item{govtrack_id}{ID assigned by http://govtrack.us
  Govtrack.us}

  \item{crp_id}{ID provided by http://opensecrets.org
  Center for Responsive Politics}

  \item{congresspedia_url}{URL of Legislator's entry on
  http://congresspedia.org Congresspedia}

  \item{twitter_id}{Congressperson's official
  http://twitter.com Twitter account}

  \item{youtube_url}{Congressperson's official
  http://youtube.com Youtube account}

  \item{facebook_id}{Facebook ID, if the legislator has a
  username then http://facebook.com/facebook_id will work,
  some users only have numeric ids in which case to get
  their URL you'll need to visit
  http://graph.facebook.com/facebook_id to get the URL
  (this graph url should work for all users)}

  \item{senate_class}{for senators I, II, or III depending
  on the Senator's election term}

  \item{birthdate}{YYYY-MM-DD formatted birth date}
}
\value{
  List of output fields.
}
\description{
  Search OpenStates bills.
}
\details{
  Currently the Sunlight Labs API provides two methods for
  obtaining information about legislators:
  sll_cg_getlegislator and sll_cg_getlegislatorlist. Both
  of these methods operate in essentially the same way, the
  main difference being that sll_cg_getlegislator returns a
  single legislator (or an error if the query would have
  resulted in multiple legislators) and
  sll_cg_getlegislatorlist returns a list of legislators (a
  list of size one is allowed). In other words,
  sll_cg_getlegislator is purely a convenience method to
  avoid dealing with a list of values when only one value
  is needed.
}
\examples{
\dontrun{
sll_cg_getlegislator(lastname = 'Pelosi')
}
}

