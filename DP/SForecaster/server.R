library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
    
  output$distPlot <- renderPlot({
    base_seas <- c(0.90, 0.86, 1.01, 0.99, 0.94, 1.18, 0.98, 0.92, 1.00, 0.97, 1.13, 1.18);
                   
                   
    
    base_seas <- ((base_seas -1) * ((input$seas+10)/10)) + 1;
    base_trend <- (input$trend/100) + 1;
    x <- 1; 
    x[1] <- input$val * base_seas[1] * base_trend;
    
    for(i in 2:12) { x[i] <- x[i-1] * base_seas[i] * base_trend};
      plot(x, type="n", xaxt="n", xlab="Month", ylab="Revenue", ylim=c(.4 *input$val,3.14*input$val));
      lines(x, lwd=2, col="navy")
      points(x, pch=21, cex=2, col="navy", bg="orange");
      axis(1, at=1:12, labels=month.name);
      title(main=paste("Total Customer Revenue: $",round(sum(x))));
  })
})
