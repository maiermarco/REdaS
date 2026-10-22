\encoding{UTF-8}
\name{Kaiser-Meyer-Olkin-Statistics}
\alias{KMOS}
\alias{print.MSA_KMO}
\title{Kaiser-Meyer-Olkin Statistics}
\description{description}
\usage{
KMOS(x, use = c("everything", "all.obs", "complete.obs", "na.or.complete",
    "pairwise.complete.obs"))

\method{print}{MSA_KMO}(x, stats = c("both", "MSA", "KMO"), vars = "all",
    sort = FALSE, show = "all", digits = getOption("digits"), \ldots)
}
\arguments{
  \item{x}{The data \eqn{\mathbf{X}}{X} for \code{KMOS()}, an object of class \code{'MSA_KMO'} for the \code{print} method.}
  \item{use}{defines the method to use if missing values are present (for a detailed explanation see \code{\link[REdaS]{bart_spher}}; see also \code{\link[stats]{cor}}).}
  \item{stats}{determines if \code{"MSA"}, \code{"KMO"} or \code{"both"} (default) are printed.}
  \item{vars}{can be \code{"all"} or a vector of index numbers of variables to print the \acronym{MSA}s for.}
  \item{sort}{sorts the \acronym{MSA}s in increasing order.}
  \item{show}{shows the specified number of variables (from 1 to the number of \emph{potentially sorted} variables).}
  \item{digits}{the number of decimal places to print.}
  \item{\dots}{further arguments.}
}
\details{
The Measure of Sampling Adequacy (\acronym{MSA}) for individual items and the Kaiser-Meyer-Olkin (\acronym{KMO}) Criterion rely on the \emph{Anti-Image-Correlation Matrix} \eqn{\mathbf{A}}{A} (for details see Kaiser & Rice, 1974) that contains all bivariate partial correlations given all other items in the \eqn{a_{ij}=r_{ij\,\vert\,\mathbf{X}\setminus\{i,\,j\}}}{a_ij = r_ij | X \\ \{i, j\}} which is:
\deqn{
\mathbf{A}=\left[\mathrm{diag}(\mathbf{R}^{-1})\right]^{-1/2}\,\mathbf{R}^{-1}\,\left[\mathrm{diag}(\mathbf{R}^{-1})\right]^{-1/2}
}{
A = [diag(R⁻¹)]^(-1 ∕ 2) R⁻¹ [diag(R⁻¹)]^(-1 ∕ 2)
}
where \eqn{\mathbf{R}}{R} is the correlation matrix, based on the data \eqn{\mathbf{X}}{X}.

The \acronym{KMO} and \acronym{MSA}s for individual items are (adapted from Equations (3) and (4) in Kaiser & Rice, 1974; note that \eqn{a}{a} is \eqn{q}{q} in the article):
\deqn{
\mathit{KMO}=\frac{\sum_{i=1}^{k}\sum_{j=1}^{k}r_{ij}^2}{\sum_{i=1}^{k}\sum_{j=1}^{k}r_{ij}^2+a_{ij}^2},\qquad i\neq j
}{
KMO = (\sum\sum r²_ij) ∕ (\sum\sum r²_ij + a²_ij), i ≠ j
}
\deqn{
\mathit{MSA}_i=\frac{\sum_{j=1}^{k}r_{ij}^2}{\sum_{j=1}^{k}r_{ij}^2+a_{ij}^2},\qquad j\neq i
}{
MSA_i = (\sum_j r²_ij) ∕ (\sum_j r²_ij + a²_ij), j ≠ i
}

Historically, as suggested in Kaiser (1974) and Kaiser & Rice (1974), a rule of thumb for those values is:
\tabular{cl}{%
  \eqn{\geq{}.9}{≥ .9}      \tab marvelous\cr%
  \eqn{[.8,\,.9)}{[.8, .9)} \tab meritorious\cr%
  \eqn{[.7,\,.8)}{[.7, .8)} \tab middling\cr%
  \eqn{[.6,\,.7)}{[.6, .7)} \tab mediocre\cr%
  \eqn{[.5,\,.6)}{[.5, .6)} \tab miserable\cr%
  \eqn{<.5}{< .5}           \tab unacceptable\cr%
}
}
\value{A list of class \code{'MSA_KMO'}
  \item{call}{the issued function call}
  \item{cormat}{correlation matrix}
  \item{pcormat}{normalized negative inverse of the correlation matrix (pairwise correlations given all other variables)}
  \item{n}{the number of observations}
  \item{k}{the number of variables/items}
  \item{MSA}{measure of sampling adequacy}
  \item{KMO}{Kaiser-Meyer-Olkin criterion}
}
\references{%
Kaiser, H. F. (1970). A Second Generation Little Jiffy. \emph{Psychometrika, 35}(4), 401--415.

Kaiser, H. F. (1974). An Index of Factorial Simplicity. \emph{Psychometrika, 39}(1), 31--36.

Kaiser, H. F., & Rice, J. (1974). Little Jiffy, Mark \acronym{IV}. \emph{Educational and Psychological Measurement, 34}, 111--117.
}
\author{Marco J. Maier}
\seealso{\code{\link[stats:cor]{cor}}, \code{\link[REdaS:bart_spher]{bart_spher}}}
\examples{
set.seed(5L)
daten <- data.frame("A"=rnorm(100), "B"=rnorm(100), "C"=rnorm(100),
                    "D"=rnorm(100), "E"=rnorm(100))
cor(daten)
KMOS(daten, use = "pairwise.complete.obs")
}
