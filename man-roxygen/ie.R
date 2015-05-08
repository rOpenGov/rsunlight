#' @param page The page of results to return; defaults to 1.
#' @param per_page The number of results to return per page, defaults to 1,000.
#' The maximum number of records per page is 100,000.
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param ... Optional additional curl options (debugging tools mostly)
#' @param as (character) One of table (default), list, or response (httr response object).
#' When table is requested, the default, a table is not always returned, but is returned almost
#' always. You can then make a table yourself if you like.
