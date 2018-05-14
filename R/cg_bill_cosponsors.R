#' Get cosponsors for a specific bill
#'
#' @export
#' @param congress congress id (numeric,integer)
#' @param id the bill id (character)
#' @template args
#' @examples \dontrun{
#' cg_bill_cosponsors(114, 'hr4249')
#' }
cg_bill_cosponsors <- function(congress, id, key = NULL, as = 'table', ...) {
  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/%s/bills/%s/cosponsors.json",
    congress, id)
  tmp <- foo_bar(as, cgurl(), path, list(), key, ...)$results[[1]]
  tmp$cosponsors <- tibble::as_tibble(as_dt(tmp$cosponsors))
  return(tmp)
}
