#' Get recent bills by subject
#'
#' @export
#' @param subject (character) A slug version of a legislative subject,
#' displayed as `url_name` in subject responses.
#' @template args
#' @return some nasty parsing, so just list of lists for now
#' @examples \dontrun{
#' cg_bills_recent_subject("meat")
#' }
cg_bills_recent_subject <- function(subject, key = NULL,
  as = 'table', ...) {

  key <- check_key(key, "PROPUBLICA_API_KEY")
  path <- sprintf("congress/v1/bills/subjects/%s.json", subject)
  res <- foo_bar(as, cgurl(), path, list(), key, ...)
  return_obj(as, res)
}
