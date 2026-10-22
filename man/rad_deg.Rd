\encoding{UTF-8}
\name{Degrees-to-Radians-to-Degrees}
\alias{deg2rad}
\alias{rad2deg}
\title{Conversion between Radians and Degrees}
\description{Converts radians to degrees and vice versa.}
\usage{deg2rad(d)

rad2deg(r)}
\arguments{
  \item{d}{degrees}
  \item{r}{radians}
}
\details{Since \eqn{\pi\,\mathrm{rad}=180^{\circ}}{π rad = 180°}, degrees (\eqn{d}{d}) can be converted to radians (\eqn{r}{r}) using
\eqn{r=d\cdot{}\pi/180}{r = d · π ∕ 180}
and the conversion of radians to degrees is
\eqn{d=r\cdot{}180/\pi}{d = r · 180 ∕ π}.}
\author{Marco J. Maier}
\seealso{see \link[base:Trig]{Trigonometric Functions}, \link[base:Hyperbolic]{Hyperbolic Functions}, \link[base:Constants]{Constants in R}}
\examples{# pi is available as a constant
pi

# 180° are pi radians
deg2rad(180)

# 2 * pi radians are 360°
rad2deg(2 * pi)}
