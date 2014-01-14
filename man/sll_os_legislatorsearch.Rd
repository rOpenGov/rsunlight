\name{sll_os_legislatorsearch}
\alias{sll_os_legislatorsearch}
\title{Search Legislators on OpenStates.}
\usage{
sll_os_legislatorsearch(state = NULL, firstname = NULL, lastname = NULL,
  chamber = NULL, active = NULL, term = NULL, district = NULL,
  party = NULL, key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{state}{state two-letter abbreviation (character)}

  \item{firstname}{first name of legislator (character)}

  \item{lastname}{last name of legislator (character)}

  \item{chamber}{one of 'upper' or 'lower' (character)}

  \item{active}{TRUE or FALSE (character)}

  \item{term}{filter by legislators who served during a
  certain term (character)}

  \item{district}{legislative district (character)}

  \item{party}{democratic or republican (character)}
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

