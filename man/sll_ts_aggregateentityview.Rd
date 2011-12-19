\name{sll_ts_aggregateentityview}
\alias{sll_ts_aggregateentityview}
\title{Look up the entity ID based on an ID from a different data set. Currently
   they provide a mapping from the ID schemes used by Center for Reponsive
   Politics (CRP) and the National Institute for Money in State Politics (NIMSP).}
\usage{
  sll_ts_aggregateentityview(id = NA, cycle = NA,
    url = "http://transparencydata.com/api/1.0/entities/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{id}{The ID of the entity in the given namespace.}

  \item{cycle}{Return contribution totals for the given
  cycle. When not given, returns totals for all cycles.}

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
  a JSON object listing the TransparencyData IDs matching
  the given external ID.
}
\description{
  Look up the entity ID based on an ID from a different
  data set. Currently they provide a mapping from the ID
  schemes used by Center for Reponsive Politics (CRP) and
  the National Institute for Money in State Politics
  (NIMSP).
}
\examples{
\dontrun{
sll_ts_aggregateentityview(id = '85ab2e74589a414495d18cc7a9233981')
}
}

