\name{sll_ts_aggregatelookupid}
\alias{sll_ts_aggregatelookupid}
\title{Look up the entity ID based on an ID from a different data set. Currently
   they provide a mapping from the ID schemes used by Center for Reponsive
   Politics (CRP) and the National Institute for Money in State Politics (NIMSP).}
\usage{
  sll_ts_aggregatelookupid(namespace = NA, id = NA,
    url = "http://transparencydata.com/api/1.0/entities/id_lookup.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{namespace}{The dataset and data type of the ID.
  Currently allowed values are: urn:crp:individual (A CRP
  ID for an individual contributor or lobbyist. Begins with
  U or C.)  urn:crp:organization (A CRP ID for an
  organization. Begins with D.)  urn:crp:recipient (A CRP
  ID for a politician. Begins with N.)
  urn:nimsp:organization (A NIMSP ID for an organization.
  Integer-valued.)  urn:nimsp:recipient (A NIMSP ID for a
  politician. Integer-valued.)}

  \item{id}{The ID of the entity in the given namespace.}

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
sll_ts_aggregatelookupid(namespace = 'urn:crp:recipient', id = 'N00007360')
}
}

