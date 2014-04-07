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
#'  \item Sunlight Labs Congress API (`cg`)
#'  \item Sunlight Labs Transparency API (`ts`)
#'  \item Sunlight Labs Open States API (`os`)
#'  \item Sunlight Labs Real Time Congress API (`rt`) 
#'  \item Sunlight Labs Capitol Words API (`cw`)
#' }
#' 
#' Note that Puerto Rico is not included in Sunlight Foundation data.
#' 
#' @name rsunlight-package
#' @aliases rsunlight
#' @docType package
#' @title Sunlight Foundation data from R.
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL

#' Sunlight Labs Transparency API sector code and names to use for searching/retreiving data.  
#' @name ts_sectors
#' @docType data
#' @keywords datasets
NULL