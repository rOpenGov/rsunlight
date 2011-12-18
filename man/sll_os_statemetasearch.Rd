\name{sll_os_statemetasearch}
\alias{sll_os_statemetasearch}
\title{Search OpenStates metadata.}
\usage{
  sll_os_statemetasearch(state,
    url = "http://openstates.org/api/v1/metadata/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{state}{state two-letter abbreviation (character)}

  \item{url}{the PLoS API url for the function (should be
  left to default)}

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
sll_os_statemetasearch('ca')
}
}

