suncompact <- function(x){
  Filter(Negate(is.null), x)
}

return_obj <- function(x, y){
  x <- match.arg(x, c('response', 'list', 'table', 'data.frame'))
  if (x == 'response') {
    y
  } else {
    out <- content(y, as = "text")
    if (x == 'list') {
      fromJSON(out, simplifyVector = FALSE, flatten = TRUE)
    } else {
      fromJSON(out)
    }
  }
}

one_vec <- function(x) {
  lens <- x[vapply(x, length, 1) > 1]
  if (length(lens) > 1) {
    stop("Only one parameter can be vectorized per function call", call. = FALSE)
  }
}

get_iter <- function(z) {
  z[vapply(z, length, 1) > 1]
}

cgurl <- function() 'https://congress.api.sunlightfoundation.com'
cwurl <- function() 'http://capitolwords.org/api'
ieurl <- function() 'http://transparencydata.com/api/1.0'
osurl <- function() 'http://openstates.org/api/v1'
