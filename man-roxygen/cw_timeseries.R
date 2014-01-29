#' @param mincount Only return results where mentions are at or above the 
#'    supplied threshold.
#' @param percentages Include the percentage of mentions versus total words in 
#'    the result objects. Valid values: 'true', 'false' (default) (character)
#' @param granularity The length of time covered by each result. Valid values: 
#'    'year', 'month', 'day' (default)
#' @param entity_type The entity type to get top phrases for. Valid values: 
#'    'date', 'month', 'state', 'legislator'
#' @param entity_value The value of the entity given in entity_type. Formats are 
#'    as follows: date: 2011-11-09; month: 201111; state: NY; 
#'    legislator (bioguide): L000551