\name{sll_cg_getdistrictzip}
\alias{sll_cg_getdistrictzip}
\title{Get districts that overlap for a certain zip code.}
\usage{
  sll_cg_getdistrictzip(zip = NA,
    url = "http://services.sunlightlabs.com/api/districts.getDistrictsFromZip.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{zip}{zip code to search}

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
  Get districts that overlap for a certain zip code.
}
\examples{
\dontrun{
sll_cg_getdistrictzip(zip = 27511)
}
}

