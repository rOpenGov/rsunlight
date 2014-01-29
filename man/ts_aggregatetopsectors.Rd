\name{ts_aggregatetopsectors}
\alias{ts_aggregatetopsectors}
\title{Return the top contributoring organizations, ranked by total dollars given.
   An organization's giving is broken down into money given directly (by
   the organization's PAC) versus money given by individuals employed by
   or associated with the organization.}
\usage{
ts_aggregatetopsectors(id = NULL, key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{id}{The ID of the entity in the given namespace.}
}
\value{
The top contributoring organizations, ranked by total
dollars given.
}
\description{
Return the top contributoring organizations, ranked by
total dollars given.  An organization's giving is broken
down into money given directly (by the organization's PAC)
versus money given by individuals employed by or associated
with the organization.
}
\examples{
\dontrun{
ts_aggregatetopsectors(id = '85ab2e74589a414495d18cc7a9233981')
}
}

