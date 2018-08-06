#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  
  sidebarLayout(
    sidebarPanel(
       numericInput("bin","Input",10),
       selectInput("select1","X-axis",choices = NULL,uiOutput("sel")),
       selectInput("select2","Y-axis",choices = NULL,uiOutput("sel1")),
       
       fileInput("file1","Browse",multiple = FALSE)
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("plot",plotOutput("distPlot")),
        tabPanel("plot1",verbatimTextOutput("text"))
      )
    )
  )
))
