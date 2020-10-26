#' Color Generator for the Shiny body input
#'
#' @param n vector of values to create colors for
#' @param low.col the color palette passed from body-input
#' @param high.col the color palette passed from body-input
#' @export
mapPalette <- function (n, lowcol = "#ff0000", midcol = "white", highcol = "#2e5984") {
  attr(color_vctr(n, text_color = color_scale(grDevices::colorRamp(c(lowcol, midcol, highcol)))), ".text_color")
}
