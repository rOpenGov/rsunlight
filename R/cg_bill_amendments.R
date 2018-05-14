#' Search for data on amendments for a specific bill
#'
#' @export
#' @param congress congress id (numeric,integer)
#' @param id the bill id (character)
#' @template args
#' @examples \dontrun{
#' cg_bill_amendments(115, 'hr1628')
#' }
cg_bill_amendments <- function(congress, id, key = NULL,
  as = 'table', ...) {

  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/bills/%s/amendments.json",
    congress, id)
  tmp <- foo_bar(as, cgurl(), path, list(), key, ...)
  tibble::as_tibble(as_dt(tmp$results[[1]]$amendments))
}
