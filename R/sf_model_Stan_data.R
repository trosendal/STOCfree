#' @export
STOCfree_Stan_data <- function(STOCfree_data){

  UseMethod("STOCfree_Stan_data")

}

STOCfree_Stan_data.default <- function(STOCfree_data){

  print("No method defined for this type of data")

}

#' @export
STOCfree_Stan_data.herd <- function(STOCfree_data){

  ## number of tests used
  n_tests <- nrow(STOCfree_data$test_perf_prior)

  ## test data
  if(n_tests == 1){

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res")]

    rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

    Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)

    ## replacing missing test data with the value 3
    Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

    Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

    ## indices for herd level tests
    herds_t1 <- with(Stan_test_data,
                     tapply(status_id, herd_id, min))

    herds_T <- with(Stan_test_data,
                    tapply(status_id, herd_id, max))

    ## number of tests
    N <- nrow(Stan_test_data)

    ## number of herds
    n_herds <- attr(STOCfree_data, "number of herds")

    Stan_data <- list(
      N = N,
      n_herds = n_herds,
      herds_t1 = herds_t1,
      herds_t2 = herds_t1 + 1,
      herds_T = herds_T,
      test_res = Stan_test_data$test_res,
      Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
      Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
      Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
      Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
      pi1_beta_a = STOCfree_data$inf_dyn_priors["pi1_a"],
      pi1_beta_b = STOCfree_data$inf_dyn_priors["pi1_b"],
      tau1_beta_a = STOCfree_data$inf_dyn_priors["tau1_a"],
      tau1_beta_b = STOCfree_data$inf_dyn_priors["tau1_b"],
      tau2_beta_a = STOCfree_data$inf_dyn_priors["tau2_a"],
      tau2_beta_b = STOCfree_data$inf_dyn_priors["tau2_b"]
    )


  } else {

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res", "test_id")]

   rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

  Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)
  Stan_test_data$test_id[is.na(Stan_test_data$test_id)] <- 0

  ## replacing missing test data with the value 3
  Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

  Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

  ## indices for herd level tests
  herds_t1 <- with(Stan_test_data,
                   tapply(status_id, herd_id, min))

  herds_T <- with(Stan_test_data,
                  tapply(status_id, herd_id, max))

  ## number of tests
  N <- nrow(Stan_test_data)

  ## number of herds
  n_herds <- attr(STOCfree_data, "number of herds")

  Stan_data <- list(
    N = N,
    n_herds = n_herds,
    herds_t1 = herds_t1,
    herds_t2 = herds_t1 + 1,
    herds_T = herds_T,
    n_tests = n_tests,
    test_res = Stan_test_data$test_res,
    test_id = Stan_test_data$test_id,
    Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
    Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
    Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
    Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
    pi1_beta_a = STOCfree_data$inf_dyn_priors["pi1_a"],
    pi1_beta_b = STOCfree_data$inf_dyn_priors["pi1_b"],
    tau1_beta_a = STOCfree_data$inf_dyn_priors["tau1_a"],
    tau1_beta_b = STOCfree_data$inf_dyn_priors["tau1_b"],
    tau2_beta_a = STOCfree_data$inf_dyn_priors["tau2_a"],
    tau2_beta_b = STOCfree_data$inf_dyn_priors["tau2_b"]
  )

  }

  return(Stan_data)

}

#' @export
STOCfree_Stan_data.herd_dynLogit <- function(STOCfree_data){

  ## number of tests used
  n_tests <- nrow(STOCfree_data$test_perf_prior)

  ## test data
  if(n_tests == 1){

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res")]

    rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

    Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)

    ## replacing missing test data with the value 3
    Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

    Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

    ## indices for herd level tests
    herds_t1 <- with(Stan_test_data,
                     tapply(status_id, herd_id, min))

    herds_T <- with(Stan_test_data,
                    tapply(status_id, herd_id, max))

    ## number of tests
    N <- nrow(Stan_test_data)

    ## number of herds
    n_herds <- attr(STOCfree_data, "number of herds")

    Stan_data <- list(
      N = N,
      n_herds = n_herds,
      herds_t1 = herds_t1,
      herds_t2 = herds_t1 + 1,
      herds_T = herds_T,
      test_res = Stan_test_data$test_res,
      Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
      Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
      Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
      Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
      logit_pi1_mean = STOCfree_data$inf_dyn_priors["logit_pi1_mean"],
      logit_pi1_sd = STOCfree_data$inf_dyn_priors["logit_pi1_sd"],
      logit_tau1_mean = STOCfree_data$inf_dyn_priors["logit_tau1_mean"],
      logit_tau1_sd = STOCfree_data$inf_dyn_priors["logit_tau1_sd"],
      logit_tau2_mean = STOCfree_data$inf_dyn_priors["logit_tau2_mean"],
      logit_tau2_sd = STOCfree_data$inf_dyn_priors["logit_tau2_sd"]
    )


  } else {

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res", "test_id")]

  rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

  Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)
  Stan_test_data$test_id[is.na(Stan_test_data$test_id)] <- 0

  ## replacing missing test data with the value 3
  Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

  Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

  ## indices for herd level tests
  herds_t1 <- with(Stan_test_data,
                   tapply(status_id, herd_id, min))

  herds_T <- with(Stan_test_data,
                  tapply(status_id, herd_id, max))

  ## number of tests
  N <- nrow(Stan_test_data)

  ## number of herds
  n_herds <- attr(STOCfree_data, "number of herds")

  Stan_data <- list(
    N = N,
    n_herds = n_herds,
    herds_t1 = herds_t1,
    herds_t2 = herds_t1 + 1,
    herds_T = herds_T,
    n_tests = n_tests,
    test_res = Stan_test_data$test_res,
    test_id = Stan_test_data$test_id,
    Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
    Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
    Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
    Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
    logit_pi1_mean = STOCfree_data$inf_dyn_priors["logit_pi1_mean"],
    logit_pi1_sd = STOCfree_data$inf_dyn_priors["logit_pi1_sd"],
    logit_tau1_mean = STOCfree_data$inf_dyn_priors["logit_tau1_mean"],
    logit_tau1_sd = STOCfree_data$inf_dyn_priors["logit_tau1_sd"],
    logit_tau2_mean = STOCfree_data$inf_dyn_priors["logit_tau2_mean"],
    logit_tau2_sd = STOCfree_data$inf_dyn_priors["logit_tau2_sd"]
  )

  }

  return(Stan_data)

}



#' @export
STOCfree_Stan_data.herd_rf <- function(STOCfree_data){

  ## number of tests used
  n_tests <- nrow(STOCfree_data$test_perf_prior)

  ## test data
  if(n_tests == 1){

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res")]

    rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

    Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)

    ## replacing missing test data with the value 3
    Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

    Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

    ## indices for herd level tests
    herds_t1 <- with(Stan_test_data,
                     tapply(status_id, herd_id, min))

    herds_T <- with(Stan_test_data,
                    tapply(status_id, herd_id, max))

    ## number of tests
    N <- nrow(Stan_test_data)

    ## number of herds
    n_herds <- attr(STOCfree_data, "number of herds")

    Stan_data <- list(
      N = N,
      n_herds = n_herds,
      herds_t1 = herds_t1,
      herds_t2 = herds_t1 + 1,
      herds_T = herds_T,
      test_res = Stan_test_data$test_res,
      Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
      Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
      Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
      Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
      pi1_beta_a = STOCfree_data$inf_dyn_priors["pi1_a"],
      pi1_beta_b = STOCfree_data$inf_dyn_priors["pi1_b"],
      tau2_beta_a = STOCfree_data$inf_dyn_priors["tau2_a"],
      tau2_beta_b = STOCfree_data$inf_dyn_priors["tau2_b"],
      theta_norm_mean = STOCfree_data$risk_factors$mean_prior,
      theta_norm_sd = STOCfree_data$risk_factors$sd_prior,
      n_risk_factors = length(STOCfree_data$risk_factors$mean_prior),
      risk_factors = as.matrix(STOCfree_data$risk_factor_data[, -(1:3)])
    )

  } else {

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res", "test_id")]

  rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

  Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)
  Stan_test_data$test_id[is.na(Stan_test_data$test_id)] <- 0

  ## replacing missing test data with the value 3
  Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

  Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

  ## indices for herd level tests
  herds_t1 <- with(Stan_test_data,
                   tapply(status_id, herd_id, min))

  herds_T <- with(Stan_test_data,
                  tapply(status_id, herd_id, max))

  ## number of tests
  N <- nrow(Stan_test_data)

  ## number of herds
  n_herds <- attr(STOCfree_data, "number of herds")

  Stan_data <- list(
    N = N,
    n_herds = n_herds,
    herds_t1 = herds_t1,
    herds_t2 = herds_t1 + 1,
    herds_T = herds_T,
    n_tests = n_tests,
    test_res = Stan_test_data$test_res,
    test_id = Stan_test_data$test_id,
    Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
    Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
    Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
    Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
    pi1_beta_a = STOCfree_data$inf_dyn_priors["pi1_a"],
    pi1_beta_b = STOCfree_data$inf_dyn_priors["pi1_b"],
    tau2_beta_a = STOCfree_data$inf_dyn_priors["tau2_a"],
    tau2_beta_b = STOCfree_data$inf_dyn_priors["tau2_b"],
    theta_norm_mean = STOCfree_data$risk_factors$mean_prior,
    theta_norm_sd = STOCfree_data$risk_factors$sd_prior,
    n_risk_factors = length(STOCfree_data$risk_factors$mean_prior),
    risk_factors = as.matrix(STOCfree_data$risk_factor_data[, -(1:3)])
  )

  }

  return(Stan_data)

}



#' @export
STOCfree_Stan_data.herd_dynLogit_rf <- function(STOCfree_data){

  ## number of tests used
  n_tests <- nrow(STOCfree_data$test_perf_prior)

  ## test data
  if(n_tests == 1){

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res")]

    rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

    Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)

    ## replacing missing test data with the value 3
    Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

    Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

    ## indices for herd level tests
    herds_t1 <- with(Stan_test_data,
                     tapply(status_id, herd_id, min))

    herds_T <- with(Stan_test_data,
                    tapply(status_id, herd_id, max))

    ## number of tests
    N <- nrow(Stan_test_data)

    ## number of herds
    n_herds <- attr(STOCfree_data, "number of herds")

    Stan_data <- list(
      N = N,
      n_herds = n_herds,
      herds_t1 = herds_t1,
      herds_t2 = herds_t1 + 1,
      herds_T = herds_T,
      test_res = Stan_test_data$test_res,
      Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
      Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
      Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
      Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
      logit_pi1_mean = STOCfree_data$inf_dyn_priors["logit_pi1_mean"],
      logit_pi1_sd = STOCfree_data$inf_dyn_priors["logit_pi1_sd"],
      logit_tau2_mean = STOCfree_data$inf_dyn_priors["logit_tau2_mean"],
      logit_tau2_sd = STOCfree_data$inf_dyn_priors["logit_tau2_sd"],
      theta_norm_mean = STOCfree_data$risk_factors$mean_prior,
      theta_norm_sd = STOCfree_data$risk_factors$sd_prior,
      n_risk_factors = length(STOCfree_data$risk_factors$mean_prior),
      risk_factors = as.matrix(STOCfree_data$risk_factor_data[, -(1:3)])
    )


  } else {

    test_data <- STOCfree_data$test_data[, c("status_id", "herd_id", "test_res", "test_id")]

  rf_data   <- STOCfree_data$risk_factor_data[, c("status_id", "herd_id", "month_id")]

  Stan_test_data <- merge(rf_data, test_data, all.x = TRUE)
  Stan_test_data$test_id[is.na(Stan_test_data$test_id)] <- 0

  ## replacing missing test data with the value 3
  Stan_test_data$test_res[is.na(Stan_test_data$test_res)] <- 3

  Stan_test_data <- Stan_test_data[order(Stan_test_data$status_id),]

  ## indices for herd level tests
  herds_t1 <- with(Stan_test_data,
                   tapply(status_id, herd_id, min))

  herds_T <- with(Stan_test_data,
                  tapply(status_id, herd_id, max))

  ## number of tests
  N <- nrow(Stan_test_data)

  ## number of herds
  n_herds <- attr(STOCfree_data, "number of herds")

  Stan_data <- list(
    N = N,
    n_herds = n_herds,
    herds_t1 = herds_t1,
    herds_t2 = herds_t1 + 1,
    herds_T = herds_T,
    n_tests = n_tests,
    test_res = Stan_test_data$test_res,
    test_id = Stan_test_data$test_id,
    Se_beta_a = STOCfree_data$test_perf_prior$Se_a,
    Se_beta_b = STOCfree_data$test_perf_prior$Se_b,
    Sp_beta_a = STOCfree_data$test_perf_prior$Sp_a,
    Sp_beta_b = STOCfree_data$test_perf_prior$Sp_b,
    logit_pi1_mean = STOCfree_data$inf_dyn_priors["logit_pi1_mean"],
    logit_pi1_sd = STOCfree_data$inf_dyn_priors["logit_pi1_sd"],
    logit_tau2_mean = STOCfree_data$inf_dyn_priors["logit_tau2_mean"],
    logit_tau2_sd = STOCfree_data$inf_dyn_priors["logit_tau2_sd"],
    theta_norm_mean = STOCfree_data$risk_factors$mean_prior,
    theta_norm_sd = STOCfree_data$risk_factors$sd_prior,
    n_risk_factors = length(STOCfree_data$risk_factors$mean_prior),
    risk_factors = as.matrix(STOCfree_data$risk_factor_data[, -(1:3)])
  )

  }

  return(Stan_data)

}
