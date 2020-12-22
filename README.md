
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dispositionEffect

<!-- badges: start -->

<!-- badges: end -->

R Package to analyze the Disposition Effect (first formalized by H.
Shefrin & M. Statman, 1985).  
The goal of dispositionEffect is to …

## Installation

You can install the released version of dispositionEffect from
[CRAN](https://CRAN.R-project.org) with:

``` r
# install.packages("dispositionEffect")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
# devtools::install_github("marcozanotti/dispositionEffect")
```

By the moment, since we are still working with a Privae Repo, you need
to install the development version via PAT from the appropriate branch.

``` r
install.packages("devtools")
devtools::install_github("marcozanotti/dispositionEffect",
                         ref = "branch_name",
                         auth_token = "cf248fcfa25a81c3caea95896beb28f4e9878ff6")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dispositionEffect)
res <- portfolio_compute(portfolio_transactions = dispositionEffect::investor, 
                                                market_prices = dispositionEffect::marketprices, 
                                                method = "all", 
                                                allow_short = TRUE, 
                                                time_threshold = "0 mins",
                                                posneg_portfolios = FALSE, 
                                                portfolio_statistics = FALSE,
                                                verbose = c(1, 1), 
                                                progress = TRUE)
```
