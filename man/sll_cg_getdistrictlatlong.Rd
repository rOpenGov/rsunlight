\name{sll_cg_getdistrictlatlong}
\alias{sll_cg_getdistrictlatlong}
\title{Get districts for a latitude/longitude.}
\usage{
sll_cg_getdistrictlatlong(latitude = NULL, longitude = NULL,
  key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{latitude}{latitude of coordinate}

  \item{longitude}{longitude of coordinate}
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

