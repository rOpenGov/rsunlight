\name{nyt_cg_membersleaving}
\alias{nyt_cg_membersleaving}
\title{Get a list of members who have left the Senate or House or have announced plans to do so.}
\usage{
  nyt_cg_membersleaving(congress_no = NA, chamber = NA,
    responseformat = "json",
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{congress_no}{The number of the Congress during
  which the members served.}

  \item{chamber}{One of 'house' or 'senate.}

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
  Get a list of members who have left the Senate or House
  or have announced plans to do so.
}
\examples{
\dontrun{
nyt_cg_membersleaving(112, 'house')
}
}

