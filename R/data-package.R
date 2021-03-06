#' @title Sample investor financial transactions
#'
#' @description A sample dataset containing 19 transactions over time.
#'
#' @format A data frame with 19 rows and 6 variables:
#' \describe{
#'   \item{investor}{id of the investor}
#'   \item{type}{binary variable indicating the type of operation, B = buy and S = sell}
#'   \item{asset}{id of the traded asset}
#'   \item{quantity}{quantity of the traded asset}
#'   \item{price}{market price of the traded asset}
#'   \item{datetime}{timestamp of the operation}
#' }
#'
#' @source \url{https://www.directa.it/index-ita.html}
"investor"


#' @title Market prices of assets traded by the sample investor
#'
#' @description A sample dataset containing 6895 market prices of 5 different assets over time.
#'
#' @format A data frame with 6895 rows and 4 variables:
#' \describe{
#'   \item{asset}{id of the asset}
#'   \item{datetime}{timestamp of market price}
#'   \item{price}{market price of the asset}
#' }
#'
#' @source \url{https://www.directa.it/index-ita.html}
"marketprices"


#' @title Realized and paper results
#'
#' @description Results obtained by means of \code{portfolio_compute} on the
#'   data sets \code{investor} and \code{marketprices}.
#'
#' @format A data frame with 5 rows and 21 variables:
#' \describe{
#'   \item{investor}{id of the investor}
#'   \item{asset}{id of the traded asset}
#'   \item{quantity}{quantity of the traded asset at the end of the portfolio
#'     updating process}
#'   \item{price}{last market price of the traded asset}
#'   \item{datetime}{timestamp of the last operation}
#'   \item{RG_count}{realized gains via count method}
#'   \item{RL_count}{realized losses via count method}
#'   \item{PG_count}{paper gains via count method}
#'   \item{PL_count}{paper losses via count method}
#'   \item{RG_total}{realized gains via total method}
#'   \item{RL_total}{realized losses via total method}
#'   \item{PG_total}{paper gains via total method}
#'   \item{PL_total}{paper losses via total method}
#'   \item{RG_value}{realized gains via value method}
#'   \item{RL_value}{realized losses via value method}
#'   \item{PG_value}{paper gains via value method}
#'   \item{PL_value}{paper losses via value method}
#'   \item{RG_duration}{realized gains via duration method}
#'   \item{RL_duration}{realized losses via duration method}
#'   \item{PG_duration}{paper gains via duration method}
#'   \item{PL_duration}{paper losses via duration method}
#' }
#'
#' @source \url{https://www.directa.it/index-ita.html}
"portfolio_results"
