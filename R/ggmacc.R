
ggmacc <- function(data, mac, abatement, fill_var, fill_colours, cost_threshold = NULL,
                   zero_line = FALSE, threshold_line = FALSE, threshold_alpha = 1) {

  # x-axis hline
  if (zero_line == TRUE) {
    zero_hline <- geom_hline(yintercept = 0, lty = 1, colour = "black")
  } else {
    zero_hline <- NULL
  }

  # cost theshold hline
  if (threshold_line == TRUE) {
    if (is.null(cost_threshold)) abort("No cost threshold supplied.")
    cost_hline <- geom_hline(yintercept = cost_threshold, lty = 2, colour = "black")
  } else {
    cost_hline <- NULL
  }

  # plot
  data %>%
    macc_prep(mac = {{ mac }}, abatement = {{ abatement }}) %>%
    ggplot() +
    geom_macc(fill = {{ fill_var }}, alpha = .data$alpha) +
    zero_hline +
    cost_hline
}

#test <- sample_df %>% rename(marg_ab_cost = mac, ab = abatement)

#ggmacc(test, marg_ab_cost, ab, cat, zero_line = T, threshold_line = T, cost_threshold = 5.5)
