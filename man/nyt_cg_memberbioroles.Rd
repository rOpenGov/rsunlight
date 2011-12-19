\name{nyt_cg_memberbioroles}
\alias{nyt_cg_memberbioroles}
\title{Get biographical and Congressional role information for a particular member of Congress.}
\usage{
  nyt_cg_memberbioroles(memberid = NA,
    responseformat = "json",
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{memberid}{The member's unique ID number
  (alphanumeric). To find a member's ID number, get the
  list of members for the appropriate House or Senate. You
  can also use the Biographical Directory of the United
  States Congress to get a member's ID. In search results,
  each member's name is linked to a record by index ID
  (e.g.,
  http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041).
  Use the index ID as member-id in your request.}

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
  List of members of a particular chamber in a particular
  Congress.
}
\description{
  Get biographical and Congressional role information for a
  particular member of Congress.
}
\examples{
\dontrun{
nyt_cg_memberbioroles('S001181')
}
}

