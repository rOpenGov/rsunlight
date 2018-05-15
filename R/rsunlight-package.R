#' Methods for retreiving data from APIs that were
#' previously under Sulight Labs
#'
#' The various APIs included here are now managed by ProPublica and
#' OpenStates organizations.
#'
#' You need API keys for Propublica APIs. Get them at
#' <https://www.propublica.org/datastore/apis>
#'
#' You need an API key for the OpenStates API. Get it at
#' <https://openstates.org/api/register/>
#'
#' We set up the functions so that you can use either env vars, or R options.
#' For env vars, put an entry in your `.Renviron` file with the names
#' `PROPUBLICA_API_KEY` and `OPEN_STATES_KEY`.
#'
#' Currently we have functions to interface with the following ProPublica API
#' and OpenStates API:
#'
#' - ProPublica Congress API (`cg`)
#' - Open States API (`os`)
#'
#' NOTES:
#'
#' - Capitol Words API is now defunct
#' - We will support ProPublica campaign finance API in the future
#'
#' @importFrom methods is
#' @importFrom utils head
#' @importFrom jsonlite fromJSON
#' @importFrom plyr rbind.fill
#' @importFrom tibble as_data_frame
#' @importFrom crul HttpClient
#' @name rsunlight-package
#' @aliases rsunlight
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @author Thomas J. Leeper \email{thosjleeper@@gmail.com}
#' @keywords package
NULL

#' Congressional sessions, up to the 114th (2015-2016)
#' @name sessions
#' @docType data
#' @keywords datasets
NULL
