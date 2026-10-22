\encoding{UTF-8}
\name{Bartlett-Sphericity}
\alias{bart_spher}
\alias{print.bart_spher}
\title{Bartlett's Test of Sphericity}
\description{Implements Barlett's Test of Sphericity which tests whether a matrix is significantly different from an identity matrix.}
\usage{bart_spher(x, use = c("everything", "all.obs", "complete.obs",
                      "na.or.complete", "pairwise.complete.obs"))

\method{print}{bart_spher}(x, \ldots)
}
\arguments{
  \item{x}{a data matrix or the object to be printed.}
  \item{use}{defines the method to use if missing values are present (see Examples and \code{\link[stats]{cor}}).}
  \item{...}{further arguments for the \code{print} method.}
}
\details{The test statistic \eqn{X^2}{X²} as defined in Eq. (3) in Bartlett (1951) is \eqn{X^2=-[(n-1)-(2k+5)/6]\cdot\log(\left|\mathbf{R}\right|)}{X² = − [(n − 1) − (2k + 5) ∕ 6] · log(|R|)}
where \eqn{n}{n} is the number of observations, \eqn{k}{k} the number of variables, and \eqn{\mathbf{R}}{R} the correlation matrix of the data supplied in \code{x}. \eqn{\left|\mathbf{R}\right|}{|R|} is the determinant of \eqn{\mathbf{R}}{R}.

Bartlett's \eqn{X^2}{X²} is asymptotically \eqn{\chi^2}{χ²}-distributed with \eqn{\mathit{df}=k(k-1)/2}{df = k (k − 1) ∕ 2} under the null hypothesis.

Note that, because the bias-corrected correlation matrix is used, \eqn{(n-1)}{(n − 1)} is employed instead of \eqn{n}{n}, as in the paper.
\subsection{Treatment of Missing Values}{

If no missing values are present in the data matrix \code{x}, \code{use} will work with any setting and no adjustments are necessary. In this case, \eqn{n}{n} is the number of rows in \code{x}.

For listwise deletion (\code{use = "complete.obs"} or \code{"na.or.complete"}), \eqn{n}{n} is the number of remaining rows in \code{x}.

When \code{use = "pairwise.complete.obs"}, \eqn{n}{n} is approximated as the sum of relative non-missing responses for all observations with 2 or more valid responses.

If listwise/pairwise methods are used to compute the correlation matrix and the test statistic, a warning will be issued when printing the object.
}
}
\value{
  A list object of class \code{'bart_spher'}
  
  \item{call}{the issued function call}
  \item{x}{the original data}
  \item{cormat}{the correlation matrix computed from the data}
  \item{use}{treatment of \code{NA}s}
  \item{n}{the number of used observations}
  \item{k}{the number of variables/items}
  \item{X2}{the computed \eqn{X^2}{X²} value}
  \item{df}{degrees of freedom}
  \item{p.value}{the \eqn{p}{p}-value}
  \item{warn}{logical value indicating whether a warning regarding missing values will be issued (see Details)}
}
\references{Bartlett, M. S. (1951). The Effect of Standardization on a \eqn{\chi^2}{χ²} Approximation in Factor Analysis. \emph{Biometrika 38}(3/4), 337--344.}
\author{Marco J. Maier}
\seealso{\code{\link[stats:cor]{cor()}} and \code{\link[REdaS:KMOS]{KMOS()}}}
\examples{
# generate a data frame with 3 variables and 100 observations
set.seed(5L)
datamatrix <- data.frame("A" = rnorm(100), "B" = rnorm(100), "C" = rnorm(100))
head(datamatrix)

# correlation matrix
cor(datamatrix)


# bartlett's test
bart_spher(datamatrix)


# effects of missing observations on correlations: to illustrate this, the first
# observation on variable A is set to NA
datamatrix[1, 1] <- NA
head(datamatrix)

# "everything" (the default) causes all correlations involving a variable with
# missing values to be NA (in this case, all pairwise correlations with the
# variable "A")
cor(datamatrix)

# "all.obs" generates an error if missing values are present.
\dontrun{
cor(datamatrix, use = "all.obs")}

# "complete.obs" and "na.or.complete" delete complete observations if there are
# NA (in this case, the first case would be deleted). If there are no complete
# cases left after the listwise deletion, "complete.obs" results in an error
# while "na.or.complete" returns a matrix with all elements being NA.
cor(datamatrix, use = "complete.obs")
cor(datamatrix, use = "na.or.complete")

# "pairwise.complete.obs" uses all non-missing pairwise values. If there are no
# non-missing value pairs in two variables, the results will be NA.
# It is possible that correlation matrices are not positive semi-definite.
cor(datamatrix, use = "pairwise.complete.obs")


# with the missing value in the first cell, the test does not work anymore:
\dontrun{
bart_spher(datamatrix)}

# deleting the whole first observation (listwise) gives
bart_spher(datamatrix, use = "na.or.complete")

# using pairwise-correlation, the result is
bart_spher(datamatrix, use = "pairwise.complete.obs")
}
