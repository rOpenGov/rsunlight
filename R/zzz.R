#' Remove null elements from a list
#' @param x Input list
#' @export
#' @keywords internal

suncompact <- function(x){
  Filter(Negate(is.null), x)
}

return_obj <- function(x, y){
  x <- match.arg(x, c('response','list','table','data.frame'))
  if(x=='response'){ y } else {
    out <- content(y, as = "text")
    if(x=='list') fromJSON(out, simplifyVector = FALSE, flatten = TRUE) else fromJSON(out)
  }
}
