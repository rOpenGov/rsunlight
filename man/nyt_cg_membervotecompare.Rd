\name{nyt_cg_membervotecompare}
\alias{nyt_cg_membervotecompare}
\title{Get a list of members who have left the Senate or House or have announced plans to do so.}
\usage{
  nyt_cg_membervotecompare(memberid_1 = NA,
    memberid_2 = NA, congress_no = NA, chamber = NA,
    responseformat = "json",
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{memberid_1}{The member's unique ID number
  (alphanumeric). To find a member's ID number, get the
  list of members for the appropriate House or Senate. You
  can also use the Biographical Directory of the United
  States Congress to get a member's ID. In search results,
  each member's name is linked to a record by index ID
  (e.g.,
  http://bioguide.congress.gov/scripts/biodisplay.pl?index=C001041).
  Use the index ID as member-id in your request.}

  \item{memberid_2}{See description for memberid_1.}

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
nyt_cg_membervotecompare('S001181', 'A000368', 112, 'senate')
}
}

