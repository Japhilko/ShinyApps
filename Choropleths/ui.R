library(shiny)

shinyUI(navbarPage("Indicators",
                   tabPanel("GDP Europe",
  sidebarPanel(
    selectInput("var", 
                label = "Choose a variable to display",
                choices = c('X2012Q3','X2012Q4','X2013Q1','X2013Q2','X2013Q3','X2013Q4','X2014Q1','X2014Q2','X2014Q3','X2014Q4','X2015Q1','X2015Q2'),
                selected = "X2012Q3")
  ),
  sidebarPanel(
    selectInput("color", 
                label = "Choose a color code to display",
                choices = c('blue2red','blue2green',"green2red","blue2yellow","matlab.like"),
                selected = "blue2red")
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("map")
  )),
  tabPanel("Unemployment Europe",
  sidebarPanel(
    selectInput("var2", 
                label = "Choose a variable to display",
                choices = c('X2014M10','X2014M11','X2014M12','X2015M01','X2015M02','X2015M03','X2015M04','X2015M05','X2015M06','X2015M07','X2015M08','X2015M09'),
                selected = 'X2014M10')
  ),
  sidebarPanel(
    selectInput("color2", 
                label = "Choose a color code to display",
                choices = c('blue2red','blue2green',"green2red","blue2yellow","matlab.like"),
                selected = "blue2red")
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("map2")
  ))
)
)