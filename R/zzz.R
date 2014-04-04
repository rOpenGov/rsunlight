#' Remove null elements from a list
#' @param x Input list
#' @export

suncompact <- function(x){
  Filter(Negate(is.null), x)
}