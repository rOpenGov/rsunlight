query <- function(url, path, args, headers, ...) {
  cli <- crul::HttpClient$new(
    url = url,
    headers = headers,
    opts = list(followlocation = TRUE, ...)
  )
  res <- cli$get(path, query = args)
  # Check status. 403s are the most likely and we don't want to be just
  if (res$status_code == 403) {
    stop("Your connection was not authorised: you have either not provided an API key, or provided
         an invalid one. Please see ?rsunlight", call. = FALSE)
  }
  res$raise_for_status()
  stopifnot(res$response_headers$`content-type` == 'application/json; charset=utf-8')
  return(res)
}
