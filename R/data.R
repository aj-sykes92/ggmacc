#' Potted example MACC dataset
#'
#' @source The author's imagination
#' @format A tbl_df with columns:
#' \describe{
#'  \item{mac}{A dbl indicating marginal abatement cost, arbitrary units}
#'  \item{abatement}{A dbl indicating abatement, arbitrary units}
#'  \item{cat}{A chr indicating measure category, a-e}
#' }
#' @examples
#' \dontrun{
#'  small_example
#' }
"small_example"

#' MACC dataset for UK silvoarable and silvopastoral systems.
#'
#' @source Analysis conducted and documented at https://github.com/aj-sykes92/agroforestry-defra-prelim
#' @format A tbl_df with columns:
#' \describe{
  #'  \item{lon}{A dbl indicating grid cell longitude, decimal degrees}
  #'  \item{lat}{A dbl indicating grid cell latitude, decimal degrees}
  #'  \item{crop}{A chr indicating crop type}
  #'  \item{area_ha}{A dbl indicating the area, under the specified crop in each grid cell, hectares}
  #'  \item{co2_tyear}{A dbl indicating abatement, tonnes carbon dioxide per year}
  #'  \item{mac_gbp_tco2}{A dbl indicating marginal abatement cost, GBP per tonne carbon dioxide}
  #' }
 #' @examples
#' \dontrun{
#'  uk_agroforestry
#' }
"uk_agroforestry"
