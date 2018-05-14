#' Get a specific bill
#'
#' @export
#' @param id (character) a bill slug, for example hr4881 - these can be
#' found in the recent bill response.
#' @param congress (character) congress number, e.g. 110
#' @template args
#' @return some nasty parsing, so just list of lists for now
#' @examples \dontrun{
#' cg_bill(115, "hr21")
#' }
cg_bill <- function(congress, id, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf('congress/v1/%s/bills/%s.json', congress, id)
  res <- foo_bar(as, cgurl(), path, list(), key, ...)
  res$results[[1]]
}
