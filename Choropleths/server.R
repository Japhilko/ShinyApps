
library(sp)
library(maptools)
library(shiny)
library(colorRamps)

data("wrld_simpl")
GDP <- readRDS("data/EurostatGDP.rds")
ind <- match(wrld_simpl@data$NAME,GDP$geo)
Europe <- wrld_simpl[!is.na(ind),]
Namen <- colnames(GDP)[-1]
ind <- match(Europe@data$NAME,GDP$geo)

for(i in 1:length(Namen)){
  eval(parse(text=paste("Europe@data$",Namen[i],
                        "<- as.numeric(GDP$",Namen[i],"[ind])",sep="")))
}

Unemp <- readRDS("data/Unemployment.rds")

Namen2 <- colnames(Unemp)[-1]
ind <- match(Europe@data$NAME,Unemp$geo)

for(i in 1:length(Namen2)){
  eval(parse(text=paste("Europe@data$",Namen2[i],
                        "<- as.numeric(Unemp$",Namen2[i],"[ind])",sep="")))
}


shinyServer(function(input,output) {
  output$map <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var,",paste("'",Namen,"'='",Namen,"'",collapse=",",sep=""),
                          ")",sep="")))
    col1 <- switch(input$color,"blue2red"=blue2red(100),
                   "blue2green"=blue2green(100),"green2red"=green2red(100),"blue2yellow"=blue2yellow(100),
                   "matlab.like"=matlab.like(100))
    spplot(Europe,data,col.regions=col1)
  })
  output$map2 <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var2,",paste("'",Namen2,"'='",Namen2,"'",collapse=",",sep=""),
                          ")",sep="")))
    col2 <- switch(input$color2,"blue2red"=blue2red(100),
                   "blue2green"=blue2green(100),"green2red"=green2red(100),"blue2yellow"=blue2yellow(100),
                   "matlab.like"=matlab.like(100))
    spplot(Europe,data,col.regions=col2)
  })
})
