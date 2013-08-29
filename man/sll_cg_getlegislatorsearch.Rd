\name{sll_cg_getlegislatorsearch}
\alias{sll_cg_getlegislatorsearch}
\title{Search congress people and senate members.}
\usage{
  sll_cg_getlegislatorsearch(name = NULL, threshold = NULL,
    all_legislators = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{name}{name to search for}

  \item{threshold}{optional threshold parameter specifying
  minimum score to return (defaults to 0.8, lower values
  not recommended)}

  \item{all_legislators}{optional parameter to search all
  legislators in API, not just those currently in office
  (false by default)}
}
\value{
  List of output fields.
}
\description{
  Search congress people and senate members.
}
\examples{
\dontrun{
sll_cg_getlegislatorsearch(name = 'Reed')
}
}

