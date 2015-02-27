#include <Rcpp.h>
#include <string>
#include "fastercaster.h"


// [[Rcpp::export]]
Rcpp::IntegerVector factor_to_integer_bylevel(Rcpp::IntegerVector factor, std::vector<std::string> levels)
{
  int i;
  Rcpp::IntegerVector ret(factor.size());
  std::string::size_type size;
  
  if (levels.size() <= factor.size())
  {
    Rcpp::IntegerVector levels_int(levels.size());
    
    #pragma omp parallel private(i) default(shared) if (levels_int.size() > OMP_MIN_SIZE)
    {
      #pragma omp for
      for (i=0; i<levels_int.size(); i++)
        levels_int[i] = std::stoi(levels[i], &size);
      
      #pragma omp for
      for (i=0; i<factor.size(); i++)
      {
        if (factor[i] == NA_INTEGER)
          ret[i] = NA_INTEGER;
        else
          ret[i] = levels_int[factor[i]-1];
      }
    }
  }
  
  return ret;
}

