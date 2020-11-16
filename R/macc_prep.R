
#' @title Data preparation for MACC plotting
#' @description Takes a dataframe containing marginal abatement cost and abatement data, and
#' computes bounding box variables to be passed to `geom_macc`. Pipe the results into a `ggplot()`
#' function and add `geom_macc`.
#' @param data A dataframe containing marginal abatement cost and abatement data.
#' @param mac The name of the variable containing marginal abatement cost data.
#' @param abatement The name of the variable containing abatement data.
#' @import dplyr
#' @importFrom rlang abort
#' @export
macc_prep <- function(data, mac, abatement) {
  data %>%
    arrange({{ mac }}) %>%
    mutate(xmax = cumsum({{ abatement }}),
           xmin = lag(.data$xmax, default = 0),
           ymin = ifelse({{ mac }} < 0, {{ mac }}, 0),
           ymax = ifelse({{ mac }} > 0, {{ mac }}, 0))
}
