\name{sll_cw_text}
\alias{sll_cw_text}
\title{Capitol words text.json method. Search the congressional record for
   instances of a word or phrase.}
\usage{
  sll_cw_text(phrase = NA, title = NA, start_date = NA,
    end_date = NA, chamber = NA, state = NA, party = NA,
    bioguide_id = NA, congress = NA, session = NA,
    cr_pages = NA, volume = NA, page_id = NA,
    url = "http://capitolwords.org/api/text.json",
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
  Phrases matched.
}
\description{
  Capitol words text.json method. Search the congressional
  record for instances of a word or phrase.
}
\examples{
\dontrun{
sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16')
sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', party='D')
sll_cw_text(phrase='I would have voted', startdate='2011-09-05', enddate='2011-09-16', chamber='House')
sll_cw_text(title='personal explanation', startdate='2011-09-05', enddate='2011-09-16')
}
}

