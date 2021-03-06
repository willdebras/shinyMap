% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map-input.R
\name{mapInput}
\alias{mapInput}
\title{An SVG Human Body Input

This input operates like a \code{shiny::radioButtons()} where you can select one of the body parts!}
\usage{
mapInput(
  inputId,
  data = NULL,
  fillcolor = "transparent",
  bordercolor = "#000080",
  borderwidth = "2px",
  ...
)
}
\arguments{
\item{inputId}{The input id}

\item{data}{a vector of 50 numbers to be converted to a continuous color scale.
The numbers correspond to the following body part vector:

 \enumerate{
  \item head
  \item left-shoulder
  \item right-shoulder
  \item left-arm
  \item right-arm
  \item left-hand
  \item right-hand
  \item chest
  \item stomach
  \item left-leg
  \item right-lef
  \item left-foot
  \item right-foot
}}

\item{...}{Passed to \code{htmltools::div()}}

\item{low.col}{continous color scale applied to data - this is the low vale color}

\item{high.col}{continous color scale applied to data - this is the high value color}

\item{color}{a single fill color for all body parts}
}
\value{
The value returned by the input to the Shiny server is either `NULL`
  when no body part is select or a character string containing
  the selected body part
}
\description{
An SVG Human Body Input

This input operates like a \code{shiny::radioButtons()} where you can select one of the body parts!
}
\examples{
\dontrun{
bodyInput("human", data = rnorm(13, 100), low.col = "pink", high.col = "purple")
}
\dontrun{
bodyInput("human", color = "steelblue")
}
}
