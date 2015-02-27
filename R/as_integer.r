#' Convert to int.
#'
#' @param x Object to coerce to type int.
#' @param ... Additional arguments.
#'
#' @export
as_integer <- function(x, ...) UseMethod("as_integer")

#' @rdname as_integer factor
#' @method as_integer factor
#' @export
as_integer.factor <- function(x, ..., by.level=TRUE)
{
  if (by.level)
    factor_to_integer_bylevel(x, levels(x))
  else
    as.integer(x)
}

