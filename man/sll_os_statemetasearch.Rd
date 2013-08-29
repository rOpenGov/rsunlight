\name{sll_os_statemetasearch}
\alias{sll_os_statemetasearch}
\title{Search OpenStates metadata.}
\usage{
  sll_os_statemetasearch(state = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{state}{state two-letter abbreviation (character)}
}
\value{
  List of output fields.
}
\description{
  Search OpenStates metadata.
}
\examples{
\dontrun{
sll_os_statemetasearch('ca')
}
}

