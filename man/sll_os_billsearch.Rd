\name{sll_os_billsearch}
\alias{sll_os_billsearch}
\title{Search OpenStates bills.}
\usage{
  sll_os_billsearch(terms, state = NA, window = NA,
    chamber = "upper", sponsor_id = NA, updated_since = NA,
    subject = NA,
    url = "http://openstates.org/api/v1/bills/",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{terms}{search terms bill search (character)}

  \item{state}{state two-letter abbreviation (character)}

  \item{window}{a string representing what time period to
  search across.  Pass 'session' to search bills from the
  state's current or most recent legislative session,
  'term' to search the current or most recent term, 'all'
  to search as far back as the Open State Project has data
  for, or supply 'session:SESSION_NAME' or 'term:TERM_NAME'
  (e.g. 'session:2009' or 'term:2009-2010') to search a
  specific session or term.}

  \item{chamber}{one of 'upper' or 'lower' (character)}

  \item{sponsor_id}{only return bills sponsored by the
  legislator with the given id (corresponds to leg_id)}

  \item{updated_since}{only return bills that have been
  updated since a given date, YYYY-MM-DD format}

  \item{subject}{filter by bills that are about a given
  subject. If multiple subject parameters are supplied then
  only bills that match all of them will be returned. See
  list of subjects}

  \item{url}{the PLoS API url for the function (should be
  left to default)}

  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  List of output fields.
}
\description{
  Search OpenStates bills.
}
\examples{
\dontrun{
sll_os_billsearch(terms = 'agriculture', state = 'tx')
sll_os_billsearch(terms = 'agriculture', state = 'tx', chamber = 'upper')
}
}

