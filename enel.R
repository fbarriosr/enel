library(shiny)
library(shinythemes)
library(shinydashboard)


ui <- dashboardPage(
  dashboardHeader(title = "ENELX"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(
        column(3, 
               h1(verbatimTextOutput("verb1"),style="color:blue;" )
        ),
        column(3, 
               h1(verbatimTextOutput("verb2"),style="color:blue;" )
        ),
        column(3, 
               h1(verbatimTextOutput("verb3"),style="color:blue;" )
        )
        ,
        column(3, 
               h1(verbatimTextOutput("verb4"),style="color:blue;" )
        )
        
        
      ),
      box(plotOutput("plot1", height = 250)),
      
      box(
        title = "Controles",
        sliderInput("slider", "N:", 1, 100, 50)
      ),
      box(
        
        selectInput("state", "Choose a state:",
                    list(`East Coast` = list("NY", "NJ", "CT"),
                         `West Coast` = list("WA", "OR", "CA"),
                         `Midwest` = list("MN", "WI", "IA"))
        ),
        textOutput("result")
        
      ),
      
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  output$result <- renderText({
    paste("You chose", input$state)
  })
  

  output$verb1 <- renderText({  "29.202"})
  output$verb2 <- renderText({  "29.202"})
  output$verb3 <- renderText({  "29.202"})
  output$verb4 <- renderText({  "29.202"})
}
shinyApp(ui, server)