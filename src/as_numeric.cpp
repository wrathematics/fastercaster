#include <Rcpp.h>
#include <string>
#include "fastercaster.h"


// [[Rcpp::export]]
Rcpp::NumericVector factor_to_numeric_bylevel(Rcpp::IntegerVector factor, std::vector<std::string> levels)
{
  int i;
  Rcpp::NumericVector ret(factor.size());
  std::string::size_type size;
  
  if (levels.size() <= factor.size())
  {
    Rcpp::NumericVector levels_numeric(levels.size());
    
    #pragma omp parallel private(i) default(shared) if (levels_numeric.size() > OMP_MIN_SIZE)
    {
      #pragma omp for
      for (i=0; i<levels_numeric.size(); i++)
        levels_numeric[i] = std::stod(levels[i], &size);
      
      #pragma omp for
      for (i=0; i<factor.size(); i++)
      {
        if (factor[i] == NA_INTEGER)
          ret[i] = NA_REAL;
        else
          ret[i] = levels_numeric[factor[i]-1];
      }
    }
  }
  
  return ret;
}


