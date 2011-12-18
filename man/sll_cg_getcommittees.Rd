\name{sll_cg_getcommittees}
\alias{sll_cg_getcommittees}
\title{Gets details (subcommittees + membership) for a committee by id.}
\usage{
  sll_cg_getcommittees(id = NA,
    url = "http://services.sunlightlabs.com/api/committees.get.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{id}{committee id (eg. JSPR)}

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
  Committee details including subcommittees and all
  members.
}
\description{
  Gets details (subcommittees + membership) for a committee
  by id.
}
\examples{
\dontrun{
sll_cg_getcommittees(id = 'JSPR')
}
}

