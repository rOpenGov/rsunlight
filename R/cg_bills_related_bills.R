#' Get related bills for a specific bill
#'
#' @export
#' @param congress congress id (numeric,integer)
#' @param id the bill id (character)
#' @template args
#' @examples \dontrun{
#' cg_bill_related_bills(115, 'hr3219')
#' }
cg_bill_related_bills <- function(congress, id, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/bills/%s/related.json",
    congress, id)
  tmp <- foo_bar(as, cgurl(), path, list(), key, ...)
  tmp$results[[1]]$related_bills
}
