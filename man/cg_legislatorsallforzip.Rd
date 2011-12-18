\name{cg_legislatorsallforzip}
\alias{cg_legislatorsallforzip}
\title{Search congress people and senate members for a zip code.}
\usage{
  cg_legislatorsallforzip(zip = NA,
    url = "http://services.sunlightlabs.com/api/legislators.allForZip.json",
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
  Search congress people and senate members for a zip code.
}
\examples{
\dontrun{
cg_legislatorsallforzip(zip = 77006)
}
}

