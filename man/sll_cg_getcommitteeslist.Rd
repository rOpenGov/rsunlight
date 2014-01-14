\name{sll_cg_getcommitteeslist}
\alias{sll_cg_getcommitteeslist}
\title{Get list of all committees for a given chamber along with their subcommittees.}
\usage{
sll_cg_getcommitteeslist(chamber = NULL, key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{chamber}{House, Senate, or Joint}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}
}
\value{
List of all committees in the specified chamber with their
subcommittees (but not memberships due to size of
response).
}
\description{
Get list of all committees for a given chamber along with
their subcommittees.
}
\examples{
\dontrun{
sll_cg_getcommitteeslist(chamber = 'Joint')
}
}

