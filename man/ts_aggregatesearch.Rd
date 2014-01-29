\name{ts_aggregatesearch}
\alias{ts_aggregatesearch}
\title{Search for entities - that is, politicians, individuals, or organizations--
   with the given name.}
\usage{
ts_aggregatesearch(search = NULL, key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{search}{The query string. Spaces should be
  URL-encoded or represented as +. There are no logic
  operators or grouping.}
}
\value{
Basic information about the the contributions to and from
each entity, as well as an ID that can be used in other API
methods to retrieve more information.
}
\description{
Search for entities - that is, politicians, individuals, or
organizations-- with the given name.
}
\examples{
\dontrun{
ts_aggregatesearch('Nancy Pelosi')
}
}

