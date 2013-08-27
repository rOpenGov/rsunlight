#' @param phrase Phrase to search.
#' @param title Title of page to search.
#' @param start_date Start date to search on.
#' @param end_date End date to search on.
#' @param chamber Chamber of congress, House or Senate.
#' @param state State, capital two-letter abbreviation (e.g., AK,AZ,NM).
#' @param party Political party (one of D,R,I).
#' @param bioguide_id Bioguide ID for politician (e.g., B000243)
#' @param congress Congressional session (e.g., 110,111,112)
#' @param session Session within the current congress (e.g., 1,2)
#' @param cr_pages No definition.
#' @param volume No definition.
#' @param page No definition. 
#' @param mincount Only return results where mentions are at or above the 
#'    supplied threshold.
#' @param percentages Include the percentage of mentions versus total words in 
#'    the result objects. Valid values: 'true', 'false' (default) (character)
#' @param granularity The length of time covered by each result. Valid values: 
#'    'year', 'month', 'day' (default)
#' @param key Your SunlightLabs API key; loads from .Rprofile.
#' @param callopts Further curl options (debugging tools mostly)
#' @param entity_type The entity type to get top phrases for. Valid values: 
#'    'date', 'month', 'state', 'legislator'
#' @param entity_value The value of the entity given in entity_type. Formats are 
#'    as follows: date: 2011-11-09; month: 201111; state: NY; 
#'    legislator (bioguide): L000551