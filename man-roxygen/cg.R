#' @param fields You can request specific fields by supplying a vector of fields names. Many fields
#' are not returned unless requested. If you don't supply a fields parameter, you will get the
#' most commonly used subset of fields only. To save on bandwidth, parsing time, and confusion,
#' it's recommended to always specify which fields you will be using.
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param return (character) One of table (default), list, or response (httr response object).
#' When table is requested, the default, a table is not always returned, but is returned almost
#' always. You can then make a table yourself if you like.
#' @param ... Optional additional curl options (debugging tools mostly). See examples.
#' @param page Page to return. Default: 1. You can use this in combination with the
#' per_page parameter to get more than the default or max number of results per page.
#' @param per_page Number of records to return. Default: 20. Max: 50.
#' @param order Sort results by one or more fields with the order parameter. order is
#' optional, but if no order is provided, the order of results is not guaranteed to be predictable.
#' Append \code{__asc} or \code{__desc} to the field names to control sort direction. The default
#' direction is \code{desc}, because it is expected most queries will sort by a date. Any field
#' which can be used for filtering may be used for sorting. On full-text search endpoints (URLs
#' ending in \code{/search}), you may sort by score to order by relevancy.
