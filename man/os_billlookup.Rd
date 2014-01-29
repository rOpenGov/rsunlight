\name{os_billlookup}
\alias{os_billlookup}
\title{Lookup bills on OpenStates.}
\usage{
os_billlookup(state = NULL, session = NULL, billid = NULL,
  key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

  \item{state}{state two-letter abbreviation (character),
  required}

  \item{session}{session of congress (integer), e.g.,
  2009-2010 = 20092010, required}

  \item{billid}{identification number of bill (character),
  required}
}
\value{
List of output fields.
}
\description{
Lookup bills on OpenStates.
}
\examples{
\dontrun{
os_billlookup(state='ca', session=20092010, billid='AB667')
}
}

