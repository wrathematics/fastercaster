#' Convert to numeric.
#'
#' @param x Object to coerce to type factor.
#' @param ... Additional arguments.
#'
#' @export
as_numeric <- function(x, ...) UseMethod("as_numeric")

#' @rdname as_numeric factor
#' @method as_numeric factor
#' @export
as_numeric.factor <- function(x, ..., by.level=TRUE)
{
  if (by.level)
    factor_to_numeric_bylevel(x, levels(x))
  else
    as.numeric(x)
}

