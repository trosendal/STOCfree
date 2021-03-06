% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glm_nwinf_lagged.R
\name{logit_nwinf_lagged}
\alias{logit_nwinf_lagged}
\title{Modelling of all possible lagged relationships between risk factor occurrence and new infection}
\usage{
logit_nwinf_lagged(
  sf_data,
  rf_data,
  rf_date_col = character(),
  rf_col = character(),
  lag1 = 0,
  lag2 = 36,
  time_of_inf = c("mid", "first", "last"),
  FUN = sum
)
}
\arguments{
\item{sf_data}{a object of class STOCfree_data with test results}

\item{rf_data}{risk factor data}

\item{rf_date_col}{name of the column the date of risk factor occurrence. The dates should be formatted as yyyy-mm-dd}

\item{rf_col}{name of the column with risk factor}

\item{lag1}{an integer value representing the minimum number of months from which to consider for risk factor occurrence}

\item{lag2}{an integer value representing the maximum number of months to consider for risk factor occurrence}

\item{rf_herd_col}{name of the column containing the herd id. The ids should be the same as in the test data}
}
\value{
a data.frame with a model AIC for each combination of lag1 (start of interval) and lag2 (end of interval)
}
\description{
Modelling of all possible lagged relationships between risk factor occurrence and new infection
}
\details{
this function models a probability of new infection as a function of risk factor occurrence considered at various time intervals before a test is performed. New infection is defined, at the herd test level, as a positive test result recorded after a negative test result on the previous test. All herds with 2 test results of which the first one is negative are eligible for a new infection. The association with risk factors recorded between lag1 months and lag2 months before the second test result are modelled with logistic regression. For each combination of lag1 and lag2 the AIC of the logistic model is recorded. The best interval is the one with the lowest AIC.

When several test results are available on a month, the first test result is used.
}
