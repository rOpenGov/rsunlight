#' @param key your SunlightLabs API key; loads from environment variable from .Renviron or
#' from an option from .Rprofile
#' @param as (character) One of table (default), list, or response (httr response object).
#' When table is requested, the default, a table is not always returned, but is returned almost
#' always. You can then make a table yourself if you like.
#' @param ... Optional additional curl options (debugging tools mostly)
#' passed on to \code{\link[crul]{HttpClient}}
