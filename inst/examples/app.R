# Example of shinykeyboard Shiny Input
library(shiny)
library(shinyMap)

data <- runif(50)

ui <- function() {
  
  fluidPage(
    shinyMap::mapInput("map", border),
    verbatimTextOutput("debug")
  )
}

server <- function(input, output) {
  output$debug <- renderPrint(input$map)
}

shinyApp(ui = ui, server = server)