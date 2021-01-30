
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
head(investor)
#>   investor type asset quantity  price            datetime
#> 1    ID123    B   ACO       45 3.9400 2018-04-09 11:17:30
#> 2    ID123    B  LSUG      450 2.0515 2018-05-17 15:06:53
#> 3    ID123    S   ACO       45 4.1800 2018-05-22 17:11:09
#> 4    ID123    B  IT3S      230 1.0980 2018-05-28 14:30:46
#> 5    ID123    S  IT3S      230 1.0300 2018-06-01 15:27:02
#> 6    ID123    B  LSUG       90 2.5300 2018-06-01 15:43:51
```

Dataset of market prices of the traded assets.

``` r
head(marketprices)
#>   asset            datetime price
#> 1   ACO 2018-01-10 15:30:00  4.28
#> 2   ACO 2018-01-10 15:45:00  4.43
#> 3   ACO 2018-01-12 12:30:00  4.36
#> 4   ACO 2018-01-23 09:15:00  4.25
#> 5   ACO 2018-01-23 10:45:00  4.25
#> 6   ACO 2018-01-23 12:15:00  4.21
```

Compute realized gains, realized losses, paper gains and paper losses.

``` r
portfolio_results <- portfolio_compute(
    portfolio_transactions = investor, 
    market_prices = marketprices, 
    allow_short = TRUE
    )
```

Compute the disposition effect with different methods.

``` r
de <- disposition_compute(portfolio_results)
de
#> # A tibble: 5 x 6
#>   investor asset DE_count DE_total DD_value DD_duration
#>   <chr>    <chr>    <dbl>    <dbl>    <dbl>       <dbl>
#> 1 ID123    ACO      0.143   0.0409  0.00870       440. 
#> 2 ID123    LSUG     0.333   0.355   0.0106       1412. 
#> 3 ID123    IT3S    -1      -1      -0.0310        -56.9
#> 4 ID123    AST     -1      -1      -0.0750       -165. 
#> 5 ID123    TFI      0       0       0               0
```

Summarise the behavior of the investor.

``` r
disposition_summary(portfolio_results)
#> Investor ID123 
#> 
#> <table class="kable_wrapper">
#> <tbody>
#>   <tr>
#>    <td> 
#> 
#> |asset | DE_count| DE_total| DD_value| DD_duration|
#> |:-----|--------:|--------:|--------:|-----------:|
#> |ACO   |    0.143|    0.041|    0.009|     439.894|
#> |LSUG  |    0.333|    0.355|    0.011|    1411.595|
#> |IT3S  |   -1.000|   -1.000|   -0.031|     -56.938|
#> |AST   |   -1.000|   -1.000|   -0.075|    -165.119|
#> |TFI   |    0.000|    0.000|    0.000|       0.000|
#> 
#>  </td>
#>    <td> 
#> 
#> |stat   | DE_count| DE_total| DD_value| DD_duration|
#> |:------|--------:|--------:|--------:|-----------:|
#> |Mean   |   -0.305|   -0.321|   -0.017|     325.887|
#> |Median |    0.000|    0.000|    0.000|       0.000|
#> |Min    |   -1.000|   -1.000|   -0.075|    -165.119|
#> |Max    |    0.333|    0.355|    0.011|    1411.595|
#> 
#>  </td>
#>   </tr>
#> </tbody>
#> </table>
```

Plot the results to spot the presence of the disposition effect.

``` r
library(ggplot2)
ggplot(de, aes(x = asset, y = DE_count, fill = asset)) +
    geom_col() +
    scale_fill_viridis_d() +
    labs(
        title = "Disposition Effect results for the traded assets.",
        subtitle = "Method Count",
        x = "", y = ""
        )
```

<img src="man/figures/README-unnamed-chunk-10-1.png" width="100%" />

Since financial data may be potentially huge in size, efficiency
concerns are solved through the parallelized versions of the main
functions.

``` r
portfolio_results_parallel <- portfolio_compute_parallel(
    portfolio_transactions = investors, 
    market_prices = marketprices, 
    allow_short = TRUE
    )
```

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/marcozanotti/dispositionEffect/issues).

For questions and other discussion, mail us at
<zanottimarco17@gmail.com>.

------------------------------------------------------------------------

Please note that this package is free and open source software, licensed
under MIT.
