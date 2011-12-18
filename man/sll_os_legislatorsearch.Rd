\name{sll_os_legislatorsearch}
\alias{sll_os_legislatorsearch}
\title{Search Legislators on OpenStates.}
\usage{
  sll_os_legislatorsearch(state = NA, firstname = NA,
    lastname = NA, chamber = NA, active = NA, term = NA,
    district = NA, party = NA,
    url = "http://openstates.org/api/v1/legislators/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{state}{state two-letter abbreviation (character)}

  \item{firstname}{first name of legislator (character)}

  \item{lastname}{last name of legislator (character)}

  \item{chamber}{one of 'upper' or 'lower' (character)}

  \item{active}{TRUE or FALSE (character)}

  \item{term}{filter by legislators who served during a
  certain term (character)}

  \item{district}{legislative district (character)}

  \item{party}{democratic or republican (character)}

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
  Search Legislators on OpenStates.
}
\examples{
\dontrun{
sll_os_legislatorsearch(state = 'ca', party = 'democratic')
sll_os_legislatorsearch(state = 'tx', party = 'democratic', active = TRUE)
}
}

