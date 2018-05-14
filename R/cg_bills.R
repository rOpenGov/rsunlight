#' Search bills
#'
#' @export
#' @param query (character) keyword or phrase. required
#' @param sort (character) "_score" or "date" (default)
#' @param dir (character) asc or desc (default)
#' @template args
#' @return some nasty parsing, so just list of lists for now
#' @examples \dontrun{
#' cg_bills(query = "megahertz")
#' cg_bills(query = "megahertz", per_page = 3)
#' }
cg_bills <- function(query, sort=NULL, dir = NULL,
  key = NULL, as = 'table', ...) {

  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- 'congress/v1/bills/search.json'
  args <- sc(list(query = query, sort = sort, dir = dir))
  res <- foo_bar(as, cgurl(), path, args, key, ...)
  parse_bills(res$results[[1]]$bills)
}

parse_bills <- function(x) {
  lapply(x, function(z) {
    z[vapply(z, class, character(1)) == "NULL"] <- NA_character_
    z[vapply(z, length, numeric(1)) == 0] <- NA_character_
    return(z)
  })
}
