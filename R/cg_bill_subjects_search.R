#' Search for bill subjects that contain a specified term
#'
#' @export
#' @param query (character) a word or phrase to search
#' @template args
#' @examples \dontrun{
#' cg_bill_subjects_search('climate')
#' }
cg_bill_subjects_search <- function(query, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- "congress/v1/bills/subjects/search.json"
  tmp <- foo_bar(as, cgurl(), path, list(query = query), key, ...)
  tibble::as_tibble(as_dt(tmp$results[[1]]$subjects))
}
