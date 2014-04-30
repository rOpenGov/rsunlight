#' Remove null elements from a list
#' @param x Input list
#' @export
#' @keywords internal

suncompact <- function(x){
  Filter(Negate(is.null), x)
}
