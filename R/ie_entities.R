#' Search for entities.
#'
#' Search for politicians, individuals, or organizations with the given name.
#'
#' @export
#' @param search (character) The query string. There are no logic operators or grouping.
#' @param type (character) Filter results to a particular type of entity. One of politician,
#'    organization, individual or industry.
#' @param namespace (character) The dataset and data type of the ID. Currently allowed values are:
#'    urn:crp:individual (A CRP ID for an individual contributor or lobbyist. Begins with U or C.)
#'    urn:crp:organization (A CRP ID for an organization. Begins with D.)
#'    urn:crp:recipient (A CRP ID for a politician. Begins with N.)
#'    urn:nimsp:organization (A NIMSP ID for an organization. Integer-valued.)
#'    urn:nimsp:recipient (A NIMSP ID for a politician. Integer-valued.)
#' @param id (character) The ID of the entity in the given namespace.
#' @param bioguide_id (character) The ID of a member of congress in the Congressional Bioguide
#'    (\url{http://bioguide.congress.gov/biosearch/biosearch.asp}). Mutually exclusive to the
#'    id/namespace parameters. Required, if namespace and id are omitted.
#' @param entity_id (character) The transparencydata ID to look up.
#' @template ie
#' @return A data.frame, list, or httr response object. Depends on parameters used.
#'
#' @examples \dontrun{
#' # Search with text string
#' ie_entities(search='Nancy Pelosi')
#' head(ie_entities(search='Jones', type='politician'))
#' head(ie_entities(search='Jones', type='organization'))
#'
#' # Search for an ID by namespace and id
#' ie_entities(namespace = 'urn:crp:recipient', id = 'N00007360')
#'
#' # Search for an ID by bioguide id
#' ie_entities(bioguide_id='L000551')
#'
#' # most parameters are vectorized, pass in more than one value
#' ie_entities(search = c('Nancy Pelosi', 'Jones'))
#' ie_entities(bioguide_id = c('L000551', 'M000355'))
#' }

ie_entities <- function(search = NULL, type = NULL, namespace = NULL, id = NULL,
  bioguide_id = NULL, entity_id = NULL, page = NULL, per_page = NULL, as = 'table',
  key = NULL, ...) {

  key <- check_key(key)
  if (!is.null(search)) {
    url <- paste0(ieurl(), "/entities.json")
    stopifnot(is.null(namespace), is.null(id), is.null(bioguide_id), is.null(entity_id))
  }
  if (!is.null(entity_id)) {
    url <- sprintf("%s/entities/%s.json", ieurl(), entity_id)
    stopifnot(is.null(search), is.null(type), is.null(namespace), is.null(id), is.null(bioguide_id))
  }
  if (!is.null(bioguide_id)) {
    url <- paste0(ieurl(), "/entities/id_lookup.json")
    stopifnot(is.null(search), is.null(type), is.null(namespace), is.null(id), is.null(entity_id))
  }
  if (!is.null(namespace) | !is.null(id)) {
    url <- paste0(ieurl(), "/entities/id_lookup.json")
    stopifnot(is.null(search), is.null(type), is.null(bioguide_id), is.null(entity_id))
  }

  args <- sc(list(apikey = key, search = search, type = type, id = id,
          namespace = namespace, bioguide_id = bioguide_id, page = page, per_page = per_page))
  give(as, url, "", args, ...)
}
