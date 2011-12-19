\name{nyt_cg_newmembers}
\alias{nyt_cg_newmembers}
\title{Get a list of the most recent new members of the current Congress.}
\usage{
  nyt_cg_newmembers(responseformat = "json",
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/new",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{responseformat}{'xml' or 'json'.}

  \item{url}{the NYT API url for the function (should be
  left to default).}

  \item{key}{your NYT Congress API key; loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  List of new members of he current Congress.
}
\description{
  Get a list of the most recent new members of the current
  Congress.
}
\examples{
\dontrun{
nyt_cg_newmembers()
}
}

