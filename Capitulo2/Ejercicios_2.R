
library(shiny)
ui <- fluidPage(
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")
  ),
  #ej 2.1.2
  sliderInput("fdeliv", "When should we deliver?", min = as.Date("2020-09-16"), max =  as.Date("2020-09-23"), 
              value = as.Date("2020-09-17"), timeFormat = "%Y-%M-%d"),
  #ej 2.1.3
  sliderInput("pasos", "Seleccione pasos", min = 0, max =  100, 
              value = 0, step = 5, animate = TRUE),
  
 # selectInput()
 #ej 2.1.1
  textInput("name", "" , placeholder = "Your name"),
  verbatimTextOutput("value")
)

server <- function(input, output) {
  output$value <-  renderText({input$name})
}

shinyApp(ui, server)
