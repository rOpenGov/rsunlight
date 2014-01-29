\name{os_statemetasearch}
\alias{os_statemetasearch}
\title{Search OpenStates metadata.}
\usage{
os_statemetasearch(state = NULL, key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{state}{state two-letter abbreviation (character)}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}
}
\value{
List of output fields.
}
\description{
Search OpenStates metadata.
}
\examples{
\dontrun{
os_statemetasearch('ca')
}
}

