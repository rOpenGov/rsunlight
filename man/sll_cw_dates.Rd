\name{sll_cw_dates}
\alias{sll_cw_dates}
\title{Capitol words dates.json method. Search the congressional record for
   instances of a word or phrase over time.}
\usage{
  sll_cw_dates(phrase = NA, title = NA, start_date = NA,
    end_date = NA, chamber = NA, state = NA, party = NA,
    bioguide_id = NA, congress = NA, session = NA,
    cr_pages = NA, volume = NA, page_id = NA, n = NA,
    granularity = NA, percentages = TRUE, printdf = TRUE,
    url = "http://capitolwords.org/api/dates.json",
    key = getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")),
    ..., curl = getCurlHandle())
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

  \item{page_id}{No definition.}

  \item{n}{No definition.}

  \item{granularity}{Month, year, day.}

  \item{percentages}{Give percentages or not.}

  \item{printdf}{print data.frame (default, TRUE) or not
  (FALSE)}

  \item{url}{the Sunlight Labs API url for the function
  (leave as default).}

  \item{key}{Your SunlightLabs API key; loads from
  .Rprofile.}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
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
sll_cw_dates(phrase='I would have voted', start_date='2001-01-20',
   end_date='2009-01-20', granularity='year', party='D', percentages=TRUE,
   printdf=TRUE)
}
}

