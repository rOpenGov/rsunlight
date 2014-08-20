#' Sunlight Foundation data from R
#'
#' You need API keys for Sunlight Foundation APIs. Please get your own API keys if you plant to use
#' these functions for Sunlight Labs (http://services.sunlightlabs.com/). We set up the functions
#' so that you can put the key in your .Rprofile file, which will be called on startup of R, and
#' then you don't have to enter your API key for each run of a function. For example, put this in
#' your `.Rprofile` file: \code{options(SunlightLabsKey = "YOURKEYHERE")}
#'
#' Currently we have functions to interface with the following Sunlight Foundation APIs, where
#' functions for each API are prefixed with a two letter code indicating the service.
#'
#' \itemize{
#'  \item Congress API (`cg`)
#'  \item Open States API (`os`)
#'  \item Capitol Words API (`cw`)
#'  \item Influence Explorer API (`ie`)
#' }
#'
#' Note that Puerto Rico is not included in Sunlight Foundation data.
#'
#' @name rsunlight-package
#' @aliases rsunlight
#' @docType package
#' @title Sunlight Foundation client for R.
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL

#' Sunlight Labs Influence Explorer API sector code and names to use for searching/retreiving data.
#' @name ie_sectors
#' @docType data
#' @keywords datasets
NULL

#' Congressional sessions, up to the 114th (2015-2016)
#' @name sessions
#' @docType data
#' @keywords datasets
NULL
