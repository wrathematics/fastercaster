#' Convert to matrix.
#'
#' @param x Object to cast as matrix.
#' @param nrows Number of rows.
#' @param ncols Number of columns.
#'
#' @export
as_matrix <- function(x, nrows, ncols)
{
  if (is.matrix(x)) return(x)
  if (!is.vector(x)) 
    x <- as.vector(x)
  
  if (missing(nrows) || missing(ncols))
  {
    nrows <- length(x)
    ncols <- 1
  }
  
  nm <- deparse(substitute(x))
  eval(parse(text=paste0("dim(", nm, ") <- c(", nrows, ", ", ncols, ")")), envir=sys.parent())
  
  invisible()
}

