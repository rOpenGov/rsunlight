\name{sll_os_billsearch}
\alias{sll_os_billsearch}
\title{Search OpenStates bills.}
\usage{
  sll_os_billsearch(terms = NULL, state = NULL,
    window = NULL, chamber = "upper", sponsor_id = NULL,
    updated_since = NULL, subject = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{key}{your SunlightLabs API key; loads from
  .Rprofile}

  \item{callopts}{Optional additional curl options
  (debugging tools mostly)}

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

