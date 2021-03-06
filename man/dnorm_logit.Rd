% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logit.R
\name{dnorm_logit}
\alias{dnorm_logit}
\title{The normal distribution on the logit scale}
\usage{
dnorm_logit(x, mean_logit = 0.5, sd_logit = 1)
}
\arguments{
\item{x}{vector of quantiles on the probability scale}

\item{mean_logit}{vector of means on the logit scale}

\item{sd_logit}{vector of standard deviations on the logit scale}
}
\value{

}
\description{
The normal distribution on the logit scale
}
\examples{
curve(dnorm_logit(x, 0, 1))
}
