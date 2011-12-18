\name{cg_getcommitteeslist}
\alias{cg_getcommitteeslist}
\title{Get list of all committees for a given chamber along with their subcommittees.}
\usage{
  cg_getcommitteeslist(chamber = NA,
    url = "http://services.sunlightlabs.com/api/committees.getList.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{chamber}{House, Senate, or Joint}

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
  List of all committees in the specified chamber with
  their subcommittees (but not memberships due to size of
  response).
}
\description{
  Get list of all committees for a given chamber along with
  their subcommittees.
}
\examples{
\dontrun{
cg_getcommitteeslist(chamber = 'Joint')
}
}

