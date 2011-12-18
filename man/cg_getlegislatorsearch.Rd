\name{cg_getlegislatorsearch}
\alias{cg_getlegislatorsearch}
\title{Search congress people and senate members.}
\usage{
  cg_getlegislatorsearch(name = NA, threshold = NA,
    all_legislators = NA,
    url = "http://services.sunlightlabs.com/api/legislators.search.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{name}{name to search for}

  \item{threshold}{optional threshold parameter specifying
  minimum score to return (defaults to 0.8, lower values
  not recommended)}

  \item{all_legislators}{optional parameter to search all
  legislators in API, not just those currently in office
  (false by default)}

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
  Search congress people and senate members.
}
\examples{
\dontrun{
cg_getlegislatorsearch(name = 'Reed')
}
}

