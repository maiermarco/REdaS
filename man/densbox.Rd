\encoding{UTF-8}
\name{Density-Box-Plot}
\alias{densbox}
\title{Density-Box-Plots}
\description{This function draws a (grouped) boxplot-like plot with with kernel density estimators.}
\usage{densbox(formula, data, rug = FALSE, from, to, gsep = .5, kernel, bw, main, ylab,
    var_names, box_out = TRUE, horizontal = FALSE, ...)}
\arguments{
  \item{formula}{a \code{formula} object that references elements in \code{data}, see Details}
  \item{data}{a data frame containing the variables specified in formula}
  \item{rug}{a logical value to add a rug to the individual density-boxes}
  \item{from}{an optional lower boundary for the kernel density estimation (see \code{\link[stats:density]{density}})}
  \item{to}{an optional upper boundary for the kernel density estimation (see \code{\link[stats:density]{density}})}
  \item{gsep}{a numeric value \eqn{\geq0}{>=0} that specifies the length of group separation if two or more grouping variables are used}
  \item{kernel}{a string specifying the type of the kernel (default: \code{"gaussian"}, see \code{\link[stats:density]{density}})}
  \item{bw}{the bandwidth for kernel density estimation (see \code{\link[stats:density]{density}})}
  \item{main}{a character object for the title}
  \item{ylab}{a character object for the \eqn{y}{y}-axis label}
  \item{var_names}{a character object to print grouping variables' names in the lower left margin -- grouping variables are treated in the order they are given in the formula}
  \item{box_out}{if \code{TRUE}, outliers treated as in standard boxplots (plotted as stars outside the boxplot's whiskers; default), if \code{FALSE}, outliers are not treated differently, i.e., minimum and maximum will be over the full range, no matter how far individual observations may be from the median with respect to the \acronym{IQR} (\emph{interquartile range}; see \code{\link[grDevices:boxplot.stats]{boxplot.stats}} and \code{\link[stats:fivenum]{fivenum}} for details on the computation of boxplot statistics).}
  \item{horizontal}{not implemented yet\ldots}
  \item{\dots}{further arguments, see Details}
}
\details{This function plots a combination of boxplots and kernel density plots to get a more informative graphic of a metric dependent variable with respect to grouped data. The central element is the \code{formula} argument that defines the dependent variable (\acronym{dv}) and grouping variables (independent variables, \acronym{iv}). For a meaningful plot, the \acronym{iv}s should be categorical variables (they are treated as factors).

In the simplest case, there is no grouping, so \code{formula} is \code{DV ~ 1}.
As grouping variables are added, the plot will be split up accordingly.
Note that the ordering of \acronym{iv}s in the formula defines how the plot is split up -- the first variable is the most general grouping, the second will form subgroups in the first variable's groups and so on \ldots

If there are cases where a level of a factor is completely missing ab initio, the level will be dropped.
Subgroups with less than 5 observations will be dropped and \dQuote{\eqn{<5}{< 5}} will be plotted instead.
}
\author{Marco J. Maier}
\seealso{
\code{\link[stats:density]{density}},
\code{\link[graphics:boxplot]{boxplot}},
\pkg{\link[grid:grid-package]{grid}} (Package)
}
\examples{
# plot a density-box-plot of one (log-normal) variable
set.seed(5L)
data1 <- rlnorm(100, 1, .5)
densbox(data1 ~ 1, from = 0, rug = TRUE)

# plots a continuous variable in (0, 1) with 2 grouping variables
data2 <- data.frame(y  = rnorm(400, rep(c(0, 1, -1, 0), each = 100), 1),
                    x1 = rep(c("A", "B"), each = 200),
                    x2 = rep(c("X", "Y", "X", "Y"), each = 100))
with(data2, tapply(y, list(x1, x2), mean))

# a density-box-plot of the data with the kernel density
# estimator constrained to the interval 0 to 1
densbox(y ~ x2 + x1, data2, main = "Plot with some\nSpecials",
  var_names = c("Second\nVariable", "First Variable"))

# the same plot with a rug and ignoring outliers in the boxplot
densbox(y ~ x2 + x1, data2, rug = TRUE, box_out = FALSE)

# density-box-plot with the same data, but no additional space between groups
# by setting gsep = 0.
# the kernel density plots have a rectangular kernel with a bandwidth of 0.25
# which results in a "jagged" appearance.
densbox(y ~ x2 + x1, data2, gsep = 0, kernel = "rectangular", bw = 0.25)
}
