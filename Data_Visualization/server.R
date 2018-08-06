#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  
  myfile <- reactive({
    req(input$file1)
    return(read.csv(input$file1$datapath, header=TRUE, sep=','))
  })
  
  axis <- reactive({
    req(input$file1)
    
    labX <- input$select1
    req(input$select1)
    laby <- input$select2
    return(data.frame(myfile[labX],myfile[laby]))
  })
  
  output$distPlot <- renderPlot({
    
    req(myfile)
    req(axis)
    # generate bins based on input$bins from ui.R
    
    mydata <- myfile()
    #mydata <- read.csv(input$file1$datapath, header=TRUE, sep=',')
    if(input$select1 == "null"){return()}
    hist(axis()[,2],breaks = input$bin)
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
  })
  
  
  output$text <- renderPrint({
    req(myfile())
    req(axis())
    str(axis())
  })
  
  observe({
    updateSelectInput(session, "select1",
                      choices = c("null",colnames(myfile())))
    updateSelectInput(session,"select2",
                      choices = c("null",colnames(myfile()))
    )})
  
  
})
