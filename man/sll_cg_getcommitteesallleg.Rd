\name{sll_cg_getcommitteesallleg}
\alias{sll_cg_getcommitteesallleg}
\title{Gets a list of all committees that a member serves on, including subcommittes.}
\usage{
  sll_cg_getcommitteesallleg(bioguide_id = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{bioguide_id}{legislator's bioguide_id}
}
\value{
  Committee details for all committees that the given
  member serves on.
}
\description{
  Gets a list of all committees that a member serves on,
  including subcommittes.
}
\examples{
\dontrun{
sll_cg_getcommitteesallleg(bioguide_id = 'S000148')
}
}

