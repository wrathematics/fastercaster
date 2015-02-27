# fastercaster

This is basically an experiment to play with different casters.

At the moment, you can avoid costly `as.character()` intermediaries
in converting factors to numerics or ints.  There is also an
`as_matrix()` which sets the dimension of the matrix in the calling
environment (avoiding a copy).

The factor casters will also use OpenMP, if available.


## Package Use

Factors:

```r
library(fastercaster)

x <- factor(sample(1:3, size=20, replace=TRUE))
x
#  [1] 2 3 3 3 3 3 3 1 1 2 1 3 2 2 3 3 3 3 3 2
# Levels: 1 2 3

num <- as_numeric(x)
num
#  [1] 2 3 3 3 3 3 3 1 1 2 1 3 2 2 3 3 3 3 3 2
typeof(num)
# [1] "double"

int <- as_integer(x)
int
#  [1] 2 3 3 3 3 3 3 1 1 2 1 3 2 2 3 3 3 3 3 2
typeof(int)
# [1] "integer"
```

Matrices:

```r
x <- rnorm(1000*100)
as_matrix(x, 1000, 100)
dim(x)
# [1] 1000  100
```

Using these casts is considerably faster than the default/suggested
methods.  See benchmarks vignette for a demonstration.



## Installation

```r
library(devtools)
install_github("wrathematics/fastercaster")
```



## License

    Copyright (c) 2015, Drew Schmidt
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:
    
    1. Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.
    
    2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
    
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
    ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.


