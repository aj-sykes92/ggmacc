#' @title A marginal abatement cost curve geom
#' @description A `ggplot2` geom with aesthetic mappings linked to the output of `macc_prep`. Add to
#' a `ggplot` object to build a marginal abatement cost curve. A pre-parameterised wrapper for
#' `geom_rect`.
#' @param fill An optional parameter to specify fill groupings to be used by `geom_macc`.
#' @param alpha An optional parameter to specify alpha (transparency) values to be used by
#' `geom_macc`.
#' @param ... Any additional arguments to pass to `geom_rect`.
#' @import ggplot2
#' @export
geom_macc <- function(fill = NULL, ...) {
  geom_rect(
    aes(xmin = .data$xmin,
        xmax = .data$xmax,
        ymin = .data$ymin,
        ymax = .data$ymax,
        fill = {{ fill }},
        alpha = {{ alpha }}
    ),
    ...)
}
