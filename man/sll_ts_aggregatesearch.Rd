\name{sll_ts_aggregatesearch}
\alias{sll_ts_aggregatesearch}
\title{Search for entities - that is, politicians, individuals, or organizations--
   with the given name.}
\usage{
  sll_ts_aggregatesearch(search = NA,
    url = "http://transparencydata.com/api/1.0/entities.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{search}{The query string. Spaces should be
  URL-encoded or represented as +. There are no logic
  operators or grouping.}

  \item{url}{the Sunlight Labs API url for the function}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Basic information about the the contributions to and from
  each entity, as well as an ID that can be used in other
  API methods to retrieve more information.
}
\description{
  Search for entities - that is, politicians, individuals,
  or organizations-- with the given name.
}
\examples{
\dontrun{
sll_ts_aggregatesearch('Nancy Pelosi')
}
}

