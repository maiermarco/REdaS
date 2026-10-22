\encoding{UTF-8}
\name{Odds-Ratios}
\alias{odds_ratios}
\alias{print.REdaS_ORs}
\alias{summary.REdaS_ORs}
\title{Compute (Log) Odds Ratios}
\description{%
This function computes the (log-)odds ratio (\acronym{OR}) for a \eqn{2\times{}2}{2 × 2} table (\code{x} must be an object of class \code{'table'} either by using \code{\link{table}} or \code{\link{as.table}}). For a \code{data frame} of \eqn{k}{k} variables with 2 categories each, all \eqn{k(k-1)/2}{k · (k − 1) ∕ 2} pairwise (log-)odds-ratios are computed.
}
\usage{
odds_ratios(x)

\method{print}{REdaS_ORs}(x, ...)

\method{summary}{REdaS_ORs}(object, ...)
}
\arguments{
\item{x}{either a \eqn{2\times{}2}{2 × 2} \code{table} object or a data frame where each variable has two categories.}
\item{object}{an object of class \code{'REdaS_ORs'}.}
\item{...}{further arguments.}
}
\details{Note that tables where one or more cells are 0 are not processed and a warning is issued in such cases.}
\value{\code{odds_ratios()} returns a list of class \code{'REdaS_ORs'}:
  \item{call}{the issued function call.}
  \item{x}{the original data.}
  \item{tables}{a list of one or more tables.}
  \item{comps}{a list of the compared variables' names.}
  \item{ORs}{a list with (log-)odds-ratios, standard errors, \eqn{z}{z}- and \eqn{p}{p}-values.}
  
\code{print.REdaS_ORs()} invisibly returns a matrix containing all statistics shown by the \code{print}-method.
}
\author{Marco J. Maier}
\examples{# create a table from a 2 x 2 matrix of frequencies using as.table()
tab <- as.table( matrix(c(49, 1, 5, 45), 2) )
dimnames(tab) <- list("LED on?" = c("no", "yes"),
                      "PC running?" = c("no", "yes"))
tab

odds_ratios(tab)

# generate a matrix with 3 variables and 100 observations
# note that each variable must have exactly two categories
set.seed(5)
x <- data.frame("A" = as.factor(sample(1:2, 100, TRUE)),
                "B" = as.factor(sample(3:4, 100, TRUE)),
                "C" = as.factor(sample(5:6, 100, TRUE)))
head(x)

res <- odds_ratios(x)

# print the results and save the summarized information in a matrix
resmat <- print(res)
resmat

# the summary method gives a rather lengthy output with all tables etc.
summary(res)
}
