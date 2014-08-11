#' Search for entities.
#'
#' Search for politicians, individuals, or organizations with the given name.
#'
#' @import httr
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
#' @return A list. Depends on parameters used. Ranges from a single ID returned to basic
#'    information about the the contributions to and from each entity.
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
#' # Search for data by entity id
#' ie_entities(entity_id='97737bb56b6a4211bcc57a837368b1a4')
#' }

ie_entities <- function(search = NULL, type = NULL, namespace = NULL, id = NULL,
  bioguide_id = NULL, entity_id = NULL, page = NULL, per_page = NULL, return='table',
  key=getOption("SunlightLabsKey", stop("need an API key for Sunlight Labs")), ...)
{
  if(!is.null(search)){
    url = "http://transparencydata.com/api/1.0/entities.json"
    assert_that(is.null(namespace), is.null(id), is.null(bioguide_id), is.null(entity_id))
  }
  if(!is.null(entity_id)){
    url <- sprintf("http://transparencydata.com/api/1.0/entities/%s.json", entity_id)
    assert_that(is.null(search), is.null(type), is.null(namespace), is.null(id), is.null(bioguide_id))
  }
  if(!is.null(bioguide_id)){
    url = "http://transparencydata.com/api/1.0/entities/id_lookup.json"
    assert_that(is.null(search), is.null(type), is.null(namespace), is.null(id), is.null(entity_id))
  }
  if(!is.null(namespace) | !is.null(id)){
    url = "http://transparencydata.com/api/1.0/entities/id_lookup.json"
    assert_that(is.null(search), is.null(type), is.null(bioguide_id), is.null(entity_id))
  }

  args <- suncompact(list(apikey = key, search = search, type = type, id = id,
          namespace = namespace, bioguide_id = bioguide_id, page=page, per_page=per_page))
  tt <- GET(url, query=args, ...)
  stop_for_status(tt)
  assert_that(tt$headers$`content-type` == 'application/json; charset=utf-8')
  return_obj(return, tt)
}
