
library(tmap)
library(shiny)
GDP <- readRDS("data/EurostatGDP.rds")

data(Europe)
ind <- match(Europe@data$name,GDP$geo)

Namen <- colnames(GDP)[-1]
for(i in 1:length(Namen)){
  eval(parse(text=paste("Europe@data$",Namen[i],
    "<- as.numeric(GDP$",Namen[i],"[ind])",sep="")))
}



shinyServer(function(input,output) {
  output$map <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var,",paste("'",Namen,"'='",Namen,"'",collapse=",",sep=""),
                          ")",sep="")))
  qtm(Europe,data)
  })

})
