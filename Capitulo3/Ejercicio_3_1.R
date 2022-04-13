library(shiny)


ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server1 <- function(input, output, server) {
  # input$greeting <- renderText(paste0("Hello ", name))
  output$greeting <- renderText(paste0("Hello ", input$name))
}

server2 <- function(input, output, server) {
  # greeting <- paste0("Hello ", input$name)
  # output$greeting <- renderText(greeting)
  greeting <- reactive(paste0("Hello ", input$name))
  output$greeting <- renderText(greeting())
}


server3 <- function(input, output, server) {
  #output$greting <- paste0("Hello", input$name)
  output$greeting <- renderText(paste0("Hello ", input$name))
  }

#shinyApp(ui, server1)
#shinyApp(ui, server2)
shinyApp(ui, server3)

#Ej 2
server1 <- function(input, output, session) {
  c <- reactive(input$a + input$b)
  e <- reactive(c() + input$d)
  output$f <- renderText(e())
}

# f  -  e  - c  - a
#               \ b
#          \ d


server2 <- function(input, output, session) {

    x <- reactive(input$x1 + input$x2 + input$x3)
  y <- reactive(input$y1 + input$y2)
  output$z <- renderText(x() / y())
}

# z  -  x  - x1  
#          \ x2
#          \ x3
#    \  y - y1
#         \y2

server3 <- function(input, output, session) {
  d <- reactive(c() ^ input$d)
  a <- reactive(input$a * 10)
  c <- reactive(b() / input$c) 
  b <- reactive(a() + input$b)
}
# d()  -  d
#      \ c()  - c
#             \ b() - b
#                   \ a() - a


#Ej 3 Por que cancela este código
# var <- reactive(df[[input$var]])
# range <- reactive(range(var(), na.rm = TRUE))

#tienen el mismo nombre las reactive expresions que las variables o funciones


