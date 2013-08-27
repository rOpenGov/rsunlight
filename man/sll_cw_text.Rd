\name{sll_cw_text}
\alias{sll_cw_text}
\title{Capitol words text.json method. Search the congressional record for
instances of a word or phrase.}
\usage{
  sll_cw_text(phrase = NULL, title = NULL,
    start_date = NULL, end_date = NULL, chamber = NULL,
    state = NULL, party = NULL, bioguide_id = NULL,
    congress = NULL, session = NULL, cr_pages = NULL,
    volume = NULL, page = NULL,
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    callopts = list())
}
\arguments{
  \item{phrase}{Phrase to search.}

  \item{title}{Title of page to search.}

  \item{start_date}{Start date to search on.}

  \item{end_date}{End date to search on.}

  \item{chamber}{Chamber of congress, House or Senate.}

  \item{state}{State, capital two-letter abbreviation
  (e.g., AK,AZ,NM).}

  \item{party}{Political party (one of D,R,I).}

  \item{bioguide_id}{Bioguide ID for politician (e.g.,
  B000243)}

  \item{congress}{Congressional session (e.g.,
  110,111,112)}

  \item{session}{Session within the current congress (e.g.,
  1,2)}

  \item{cr_pages}{No definition.}

  \item{volume}{No definition.}

  \item{page}{No definition.}

  \item{mincount}{Only return results where mentions are at
  or above the supplied threshold.}

  \item{percentages}{Include the percentage of mentions
  versus total words in the result objects. Valid values:
  'true', 'false' (default) (character)}

  \item{granularity}{The length of time covered by each
  result. Valid values: 'year', 'month', 'day' (default)}

  \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}

  \item{callopts}{Further curl options (debugging tools
  mostly)}

  \item{entity_type}{The entity type to get top phrases
  for. Valid values: 'date', 'month', 'state',
  'legislator'}

  \item{entity_value}{The value of the entity given in
  entity_type. Formats are as follows: date: 2011-11-09;
  month: 201111; state: NY; legislator (bioguide): L000551}
}
\value{
  Phrases matched.
}
\description{
  Capitol words text.json method. Search the congressional
  record for instances of a word or phrase.
}
\examples{
\dontrun{
sll_cw_text(phrase='climate change', start_date='2012-09-16', end_date='2012-09-20')
sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', party='D')
sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', chamber='House')
sll_cw_text(title='personal explanation', startdate='2011-09-05', enddate='2011-09-16')

out <- sll_cw_text(phrase='climate change', start_date='2010-01-01', end_date='2012-12-01')
out2 <- ldply(2:13, function(x) sll_cw_text(phrase='climate change', start_date='2010-01-01', end_date='2012-12-01', page=x))
alldat <- rbind(out, out2)
str(alldat)
}
}

