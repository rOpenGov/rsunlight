% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cg_bill_amendments.R
\name{cg_bill_amendments}
\alias{cg_bill_amendments}
\title{Search for data on amendments for a specific bill}
\usage{
cg_bill_amendments(congress, id, key = NULL, as = "table", ...)
}
\arguments{
\item{congress}{congress id (numeric,integer)}

\item{id}{the bill id (character)}

\item{key}{your SunlightLabs API key; loads from environment variable from .Renviron or
from an option from .Rprofile}

\item{as}{(character) One of table (default), list, or response (httr response object).
When table is requested, the default, a table is not always returned, but is returned almost
always. You can then make a table yourself if you like.}

\item{...}{Optional additional curl options (debugging tools mostly)
passed on to \code{\link[crul]{HttpClient}}}
}
\description{
Search for data on amendments for a specific bill
}
\examples{
\dontrun{
cg_bill_amendments(115, 'hr1628')
}
}
