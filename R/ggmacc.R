#' @title Out-of-the-box marginal abatement cost curve
#' @description Wrapper compiling the functionality of the rest of the `ggmacc` package. Make a
#' stylish, customisable marginal abatement cost curve plot.
#' @param data A dataframe containing marginal abatement cost and abatement data.
#' @param mac The variable in `data` containing marginal abatement cost data.
#' @param abatement The variable in `data` containing marginal abatement cost data.
#' @param fill An optional parameter to specify a fill variable to be used by `geom_macc`.
#' @param cost_threshold An optional parameter to specify a cost threshold for the marginal
#' abatement cost. Modifies the behaviour of `threshold_line` and `threshold_alpha`.
#' @param zero_line An optional parameter; logical indicating whether a solid line should be plotted
#' at `mac` = 0.
#' @param threshold_line An optional parameter; logical indicating whether to implement a horizontal
#' line indicating the `mac` cost threshold. Requires that `cost_threshold` be specified.
#' @param threshold_fade An optional parameter to set the alpha (transparency) value for plot
#' elements which exceed the marginal abatement cost threshold. Should be between 0 and 1; defaults
#' to 1 (no transparency).
#' @import dplyr ggplot2
#' @importFrom rlang abort
#' @export
ggmacc <- function(data, mac, abatement, fill = NULL, cost_threshold = NULL,
                   zero_line = FALSE, threshold_line = FALSE, threshold_fade = 1) {

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

  # prepare data for macc
  data <-   data %>%
    macc_prep(mac = {{ mac }}, abatement = {{ abatement }})

  # set threshold alpha
  if (!is.null(cost_threshold)) {
    alpha <- ifelse(pull(data, {{ mac }}) >= cost_threshold, threshold_fade, 1)
  } else {
    alpha <- rep(1, nrow(data))
  }

  # plot
  data %>%
    ggplot() +
    geom_macc(fill = {{ fill }}, alpha = alpha) +
    zero_hline +
    cost_hline
}
