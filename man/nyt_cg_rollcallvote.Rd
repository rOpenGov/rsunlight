\name{nyt_cg_rollcallvote}
\alias{nyt_cg_rollcallvote}
\title{Get a specific roll-call vote, including a complete list of member positions.}
\usage{
  nyt_cg_rollcallvote(congress_no = NA, chamber = NA,
    session_no = NA, rollcall_no = NA,
    responseformat = "json",
    url = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/",
    key = getOption("NYTCongressKey", stop("need an API key for the NYT Congress API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{congress_no}{The number of the Congress during
  which the members served.}

  \item{chamber}{One of 'house' or 'senate.}

  \item{session_no}{1, 2, or special session number (For a
  detailed list of Congressional sessions, see
  http://www.senate.gov/reference/resources/pdf/congresses2.pdf).}

  \item{rollcall_no}{Integer. To get roll-call numbers, see
  the official sites of the US Senate
  (http://www.senate.gov/pagelayout/legislative/a_three_sections_with_teasers/votes.htm),
  and US House
  (http://artandhistory.house.gov/house_history/index.aspx).}

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
  Get a specific roll-call vote, including a complete list
  of member positions.
}
\description{
  Get a specific roll-call vote, including a complete list
  of member positions.
}
\examples{
\dontrun{
nyt_cg_rollcallvote(112, 'house', 1, 00235)
}
}

