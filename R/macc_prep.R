
#' @title Data preparation for MACC plotting
#' @description Takes a dataframe containing marginal abatement cost and abatement data, and
#' computes bounding box variables to be passed to `geom_macc`. Pipe the results into a `ggplot()`
#' function and add `geom_macc`.
#' @param data A dataframe containing marginal abatement cost and abatement data.
#' @param mac The name of the variable containing marginal abatement cost data.
#' @param abatement The name of the variable containing abatement data.
#' @import dplyr
macc_prep <- function(data, mac, abatement) {
  if (is.null(data))
    abort("No data to prepare.")
  if (is.null(mac))
    abort("No marginal abatement cost variable specified.")
  if (is.null(abatement))
    abort("No abatement variable specified.")

  data %>%
    arrange({{ mac }}) %>%
    mutate(xmax = cumsum({{ abatement }}),
           xmin = lag(xmax, default = 0),
           ymin = ifelse({{ mac }} < 0, {{ mac }}, 0),
           ymax = ifelse({{ mac }} > 0, {{ mac }}, 0))
}

