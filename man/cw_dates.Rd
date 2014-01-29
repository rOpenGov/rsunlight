\name{cw_dates}
\alias{cw_dates}
\title{Capitol words dates.json method. Search the congressional record for
instances of a word or phrase over time.}
\usage{
cw_dates(phrase = NULL, title = NULL, start_date = NULL,
  end_date = NULL, chamber = NULL, state = NULL, party = NULL,
  bioguide_id = NULL, congress = NULL, session = NULL, cr_pages = NULL,
  volume = NULL, page_id = NULL, n = NULL, granularity = NULL,
  percentages = "true", key = getOption("SunlightLabsKey",
  stop("need an API key for Sunlight Labs")), callopts = list())
}
\arguments{
  \item{phrase}{Phrase to search.}

  \item{start_date}{Start date to search on.}

  \item{end_date}{End date to search on.}

  \item{chamber}{Chamber of congress, House or Senate.}

  \item{state}{State, capital two-letter abbreviation
  (e.g., AK,AZ,NM).}

  \item{party}{Political party (one of D,R,I).}

  \item{bioguide_id}{Bioguide ID for politician (e.g.,
  B000243)}

  \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}

  \item{callopts}{Further curl options (debugging tools
  mostly)}

  \item{title}{Title of page to search.}

  \item{congress}{Congressional session (e.g.,
  110,111,112)}

  \item{session}{Session within the current congress (e.g.,
  1,2)}

  \item{cr_pages}{No definition.}

  \item{volume}{No definition.}

  \item{page_id}{Page id.}

  \item{n}{Size, not sure what this is.}

  \item{percentages}{Include the percentage of mentions
  versus total words in the result objects. Valid values:
  'true', 'false' (default) (character)}

  \item{granularity}{The length of time covered by each
  result. Valid values: 'year', 'month', 'day' (default)}
}
\value{
Data frame or JSON object of observations by date.
}
\description{
Capitol words dates.json method. Search the congressional
record for instances of a word or phrase over time.
}
\examples{
\dontrun{
cw_dates(phrase='I would have voted', start_date='2001-01-20',
   end_date='2009-01-20', granularity='year', party='D')
}
}

