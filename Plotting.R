#Make three seperate fake time series data sets : Station1, Station2 & Station3
#Datesets are to represent different lengths and variables
DateTime1 <- c(seq(from=as.POSIXct("2012-1-1 0:00", tz="UTC"),to=as.POSIXct("2012-1-12 23:00", tz="UTC"),by="hour"))
Rain <- c(runif(288,min=5,max=100))
Temp <- c(runif(288,min=25,max=40))

DateTime2 <- c(seq(from=as.POSIXct("2012-1-7 0:00", tz="UTC"),to=as.POSIXct("2012-1-12 23:00", tz="UTC"),by="hour"))
Humidity <- c(runif(144,min=60,max=80))
Wind <- c(runif(144,min=0,max=4))

DateTime3 <- c(seq(from=as.POSIXct("2012-1-8 0:00", tz="UTC"),to=as.POSIXct("2012-1-12 23:00", tz="UTC"),by="hour"))
Level <- c(runif(120,min=4,max=8))
Solar <- c(runif(120,min=300,max=1000))

Station1 <- data.frame(DateTime1, Rain, Temp)
names(Station1)[1] <- "Timestamp"
Station2 <- data.frame(DateTime2, Humidity, Wind)
names(Station2)[1] <- "Timestamp"
Station3 <- data.frame(DateTime3, Level,Solar)
names(Station3)[1] <- "Timestamp"


#Start Shiny bit
library(shiny)
library(ggplot2)

# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  #select station for plotting
  selectInput("site", "Select site:", c("Station1","Station2","Station3")),
  
  #select variable from chosen site 
  #STUCK ON THIS BIT OF GETTING COLUMN NAMES FROM THE SELECTED FILE
  selectizeInput("measurement", "Measured parameter: Multi-select", choices = ????, multiple = TRUE),
 
  #select time period to view with default last week
  dateRangeInput(inputId = "dateRange", label = "Date range to view:", start = Sys.Date()-14, end = Sys.Date(), min = "2019-11-30", max = Sys.Date()),
  
  #create plot
  plotOutput("data")
  
)

server <- function(input, output) {
  #reactive for selecting station
  datasetInput <- reactive({
    switch(input$site,
           "Station1" = Station1,
           "Station2" = Station2,
           "Station3" = Station3)
  
  #reactive for selecting variable for given site
    
  #reactive for selecting time period to plot

  #create time series line plot in ggplot2 with x always 'Timestamp'
    
  })
}

# Create Shiny app ----
shinyApp(ui, server)