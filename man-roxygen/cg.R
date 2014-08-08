#' @param fields You can request specific fields by supplying a vector of fields names. Many fields
#' are not returned unless requested. If you don’t supply a fields parameter, you will get the
#' most commonly used subset of fields only. To save on bandwidth, parsing time, and confusion,
#' it’s recommended to always specify which fields you will be using.
#' @param key your SunlightLabs API key; loads from .Rprofile
#' @param return (character) One of table (default), list, or response (httr response object)
#' @param ... Optional additional curl options (debugging tools mostly). See examples.
#' @param page Page to return. Default: 1. You can use this in combination with the
#' per_page parameter to get more than the default or max number of results per page.
#' @param per_page Number of records to return. Default: 20. Max: 50.
