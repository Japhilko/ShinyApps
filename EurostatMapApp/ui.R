
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("GDP Europe"),
  sidebarPanel(
    selectInput("var", 
                label = "Choose a variable to display",
                choices = c('X2012Q3','X2012Q4','X2013Q1','X2013Q2','X2013Q3','X2013Q4','X2014Q1','X2014Q2','X2014Q3','X2014Q4','X2015Q1','X2015Q2'),
                selected = "X2012Q3")
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("map")
  )
)
)
# paste("'",Namen,"'",collapse=",",sep="")