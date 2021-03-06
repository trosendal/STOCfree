% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sf_data.R
\name{sf_add_risk_factor}
\alias{sf_add_risk_factor}
\title{Add a risk factor to STOCfree_data}
\usage{
sf_add_risk_factor(
  sfd,
  risk_factor_data,
  risk_herd_col = NULL,
  risk_date_col = NULL,
  risk_factor_col = NULL,
  risk_factor_type = c("continuous", "categorical"),
  risk_factor_ref = NULL,
  lag1 = 0,
  lag2 = 0,
  FUN = sum
)
}
\arguments{
\item{sfd}{STOC free data}

\item{risk_factor_data}{a data.frame with a risk factor}

\item{risk_herd_col}{name of the column with herd / farm identifiers}

\item{risk_date_col}{name of the column with date when the risk factors apply}

\item{risk_factor_col}{name of the column(s) with risk factor values}

\item{risk_factor_type}{risk factor type. Must be either continuous or categorical}

\item{lag1}{start of the time interval for risk factor aggregation}

\item{lag2}{end of the time interval for risk factor aggregation}

\item{FUN}{function used for risk factor aggregation. By default sum() is used, the values are added.}
}
\value{

}
\description{
Add a risk factor to STOCfree_data
}
