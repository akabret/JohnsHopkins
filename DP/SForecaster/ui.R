library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sales Forecaster"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("val",
                   "Starting Value (0-100)",
                   min = 1, 
                   max = 100,
                   value = 50),
      sliderInput("trend",
                  "Monthly Trending (0 = flat)",
                  min = -5,
                  max = 10,
                  value = 2),
      sliderInput("seas",
                  "Seasonality (0 = normal seasonality effect",
                  min = -10,
                  max = 10,
                  value = 0,
                  step=5)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
