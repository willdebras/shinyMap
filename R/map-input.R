#' @title An SVG Human Body Input
#'
#' This input operates like a \code{shiny::radioButtons()} where you can select one of the body parts!
#'
#' @import shiny
#'
#' @param inputId The input id
#' @param data a vector of 50 numbers to be converted to a continuous color scale.
#' The numbers correspond to the following body part vector:
#'
#'  \enumerate{
#'   \item head
#'   \item left-shoulder
#'   \item right-shoulder
#'   \item left-arm
#'   \item right-arm
#'   \item left-hand
#'   \item right-hand
#'   \item chest
#'   \item stomach
#'   \item left-leg
#'   \item right-lef
#'   \item left-foot
#'   \item right-foot
#' }
#'
#'
#' @param low.col continous color scale applied to data - this is the low vale color
#' @param high.col continous color scale applied to data - this is the high value color
#' @param color a single fill color for all body parts
#' @param ... Passed to \code{htmltools::div()}
#'
#' @return The value returned by the input to the Shiny server is either `NULL`
#'   when no body part is select or a character string containing
#'   the selected body part
#'
#' @export
#'
#' @examples
#' \dontrun{
#' bodyInput("human", data = rnorm(13, 100), low.col = "pink", high.col = "purple")
#' }
#' \dontrun{
#' bodyInput("human", color = "steelblue")
#' }

mapInput <- function(
  inputId,
  data = NULL,
  fillcolor = "transparent",
  bordercolor = "#000080",
  borderwidth = "2px",
  ...
) {

  if (is.null(data)) {
    data = rep(color, 13)
  } else {
      data = bodyPalette(data, low.col, high.col)
  }

  map_options <- list(
    html = HTML(glue::glue(keyboard_string))
  )

  htmltools::tagList(
    htmltools::htmlDependency(
      name    = "shinyMap",
      version = utils::packageVersion("shinyMap"),
      package = "shinyMap",
      src     = "js",
      script  = "shinyMap.js",
      stylesheet = "styles.css"
    ),
    tags$div(
      # change this to use our css
      class = "map",
      id = inputId,
      `data-input-id` = inputId,
      ...,
      map_options
    )
  )

}