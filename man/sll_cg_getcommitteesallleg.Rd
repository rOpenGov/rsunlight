\name{sll_cg_getcommitteesallleg}
\alias{sll_cg_getcommitteesallleg}
\title{Gets a list of all committees that a member serves on, including subcommittes.}
\usage{
  sll_cg_getcommitteesallleg(bioguide_id = NA,
    url = "http://services.sunlightlabs.com/api/committees.allForLegislator.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{bioguide_id}{legislator's bioguide_id}

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
  Committee details for all committees that the given
  member serves on.
}
\description{
  Gets a list of all committees that a member serves on,
  including subcommittes.
}
\examples{
\dontrun{
sll_cg_getcommitteesallleg(bioguide_id = 'S000148')
}
}

