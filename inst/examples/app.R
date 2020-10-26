# Example of shinykeyboard Shiny Input
library(shiny)
library(shinyMap)

datatest <- runif(51)

ui <- function() {
  
  fluidPage(
    shinyMap::mapInput("map", data = datatest),
    verbatimTextOutput("debug")
  )
}

server <- function(input, output) {
  output$debug <- renderPrint(input$map)
}

shinyApp(ui = ui, server = server)