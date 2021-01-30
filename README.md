
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dispositionEffect <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start
[![CRAN status](https://www.r-pkg.org/badges/version/dplyr)](https://cran.r-project.org/package=dplyr)
[![R build status](https://github.com/tidyverse/dplyr/workflows/R-CMD-check/badge.svg)](https://github.com/tidyverse/dplyr/actions?workflow=R-CMD-check)
[![Codecov test coverage](https://codecov.io/gh/tidyverse/dplyr/branch/master/graph/badge.svg)](https://codecov.io/gh/tidyverse/dplyr?branch=master)
badges: end -->

The `dispositionEffect` package allows to quickly evaluate the presence
of disposition effect’s behaviors of an investor based solely on his
transactions and the market prices of the traded assets.

## Installation

You will be able to install the released version of `dispositionEffect`
from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("dispositionEffect")
```

By the moment, you can only install the development version from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("marcozanotti/dispositionEffect")
```

<!--``` {r, eval = FALSE}
install.packages("devtools")
devtools::install_github("marcozanotti/dispositionEffect",
                         ref = "branch_name",
                         auth_token = "cf248fcfa25a81c3caea95896beb28f4e9878ff6")
```-->

## Example

The following simple example with real data shows the implemented
functionalities.

``` r
library(dispositionEffect)
```

Portfolio of trasactions of a real investor.

``` r
investor %>% head()
```

Dataset of market prices of the traded assets.

``` r
marketprices %>% head()
```

Compute realized gains, realized losses, paper gains and paper losses.

``` r
portfolio_results <- portfolio_compute(
    portfolio_transactions = investor, 
    market_prices = marketprices, 
    allow_short = TRUE
    )
```

Summarise the behavior of the investor and plot the results to spot the
presence of the disposition effect.

Since financial data may be potentially huge in size, efficiency
concerns are solved through the parallelized versions of the main
functions.

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/marcozanotti/dispositionEffect/issues).

For questions and other discussion, mail us at
**<zanottimarco17@gmail.com>**.

------------------------------------------------------------------------

Please note that this package is free and open source software, licensed
under MIT.
