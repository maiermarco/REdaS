\encoding{UTF-8}
\name{Confidence-Intervals-for-Frequencies}
\alias{freqCI}
\alias{print.freqCI}
\alias{barplot.freqCI}
\title{Confidence Intervals for Relative Frequencies}
\description{This function computes (one or more) confidence intervals (\acronym{CI}s) for a vector of observations or a \code{table} object and returns an object of class \code{'freqCI'} to draw a bar plot of the results.}
\usage{freqCI(x, level = 0.95)

\method{print}{freqCI}(x, percent = TRUE, digits, ...)

\method{barplot}{freqCI}(height, percent = TRUE, ...)}
\arguments{
  \item{x}{must either be a numeric or factor object of \emph{individual observations} (character vectors are also accepted, but a warning is issued) or an object of class \code{'table'} of frequencies (produced using \code{\link[base]{table}} or \code{\link[base]{as.table}})}
  \item{level}{a numeric vector of confidence levels in \eqn{(0,\,1)}{(0, 1)}.}
  \item{percent}{if \code{TRUE}, all values are printed as percentages, else relative frequencies are printed.}
  \item{digits}{the number of digits to print (default to 2 if values are represented as percents or 4 if relative frequencies are used.}
  \item{height}{to plot the proportions and confidence intervals, an object of class \code{'freqCI'} must be used with the generic \code{barplot} function.}
  \item{...}{further arguments.}
}
\details{
ref to the book
}
\value{\code{freqCI()} returns an object of class \code{'freqCI'} as a list:
\item{call}{the function call issued}
\item{x}{the original object}
\item{level}{the confidence levels}
\item{freq}{a numeric vector of frequencies}
\item{n}{the number of observations}
\item{rel_freq}{relative frequencies}
\item{cat_names}{category names}
\item{CIs_low}{lower confidence interval boundary/boundaries}
\item{CIs_high}{upper confidence interval boundary/boundaries}

\code{print.freqCI()} invisibly returns a matrix with the confidence intervals and estimates.

\code{barplot.freqCI()} invisibly returns a vector with the \eqn{x}{x}-coordinates of the plotted bars.
}
\author{Marco J. Maier}
\seealso{
\code{\link[base:table]{table}}, \code{\link[base:as.table]{as.table}},
\code{\link[graphics:barplot]{barplot}}
}
\examples{
# generate some simple data using rep() and inspect them using table()
mydata <- rep(letters[1:3], c(100,200,300))
table(mydata)
100 * prop.table(table(mydata))

# compute 95% and 99% confidence intervals and print them with standard settings
res <- freqCI(mydata, level = c(.95, .99))
res

# print the result as relative frequencies rounded to 3 digits, save the result
# and print the invisibly returned matrix
resmat <- print(res, percent = FALSE, digits = 3)
resmat

# plot the results and save the x-coordinates
x_coo <- barplot(res)
x_coo

# use the x-coordinates to plot the frequencies per category
text(x_coo, 0, labels = paste0("n = ", res$freq), pos = 3)
}
