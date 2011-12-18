\name{sll_os_billlookup}
\alias{sll_os_billlookup}
\title{Lookup bills on OpenStates.}
\usage{
  sll_os_billlookup(state, session, billid,
    url = "http://openstates.org/api/v1/bills/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")))
}
\arguments{
  \item{state}{state two-letter abbreviation (character),
  required}

  \item{session}{session of congress (integer), e.g.,
  2009-2010 = 20092010, required}

  \item{billid}{identification number of bill (character),
  required}

  \item{url}{the PLoS API url for the function (should be
  left to default)}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}
}
\value{
  List of output fields.
}
\description{
  Lookup bills on OpenStates.
}
\examples{
\dontrun{
sll_os_billlookup('ca', 20092010, 'AB667')
}
}

