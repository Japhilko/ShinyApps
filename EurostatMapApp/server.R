
library(tmap)
library(shiny)
GDP <- readRDS("data/EurostatGDP.rds")

data(Europe)
ind <- match(Europe@data$name,GDP$geo)
Europe@data$X2012Q3 <- as.numeric(GDP$X2012Q3[ind])
Europe@data$X2012Q4 <- as.numeric(GDP$X2012Q4[ind])

shinyServer(function(input,output) {
  output$map <- renderPlot({
  data <- switch(input$var,"X2012Q3" = "X2012Q3",
                 "X2012Q4" = "X2012Q4")
  qtm(Europe,data)
  })

})
