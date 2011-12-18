\name{sll_cg_getdistrictlatlong}
\alias{sll_cg_getdistrictlatlong}
\title{Get districts for a latitude/longitude.}
\usage{
  sll_cg_getdistrictlatlong(latitude = NA, longitude = NA,
    url = "http://services.sunlightlabs.com/api/districts.getDistrictFromLatLong.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{latitude}{latitude of coordinate}

  \item{longitude}{longitude of coordinate}

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
  Get districts for a latitude/longitude.
}
\examples{
\dontrun{
sll_cg_getdistrictlatlong(latitude = 35.778788, longitude = -78.787805)
}
}

