#' ptwikiwords
#'
#' Dataset containing words found when randomly downloaded 12.000
#' pages from \url{https://pt.wikipedia.org/}.
#'
#' @format A data frame with 146444 rows and 3 variables:
#' \describe{
#'   \item{word}{word, as is, found in Wikipedia pages}
#'   \item{count}{number of times the word was found in the sample of Wikipedia pages}
#'   \item{check}{wheter the word exists in the portuguese language (\code{hunspell_check} result)}
#' }
#'
"ptwikiwords"
