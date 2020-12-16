library(UsingR)
library(shiny)

# Read the dataset and remove outlier
bodyfat <- read.csv("http://staff.pubhealth.ku.dk/~tag/Teaching/share/data/Bodyfat.csv")
bodyfat <- bodyfat[,-1]
bodyfat <- bodyfat[-42,]
bodyfat$BMI <- bodyfat$Weight*0.4536 / (bodyfat$Height*0.0254)^2

# fit.lm <- lm(bodyfat~BMI, data=bodyfat)

# Define server logic required to make the prediction
shinyServer(function(input, output) {

    # weight <- input$weight
    # height <- input$height
    # BMI <- weight*0.4536 / (height*0.0254)^2
    # pred <- -22.85937 + 1.65269*BMI
    
    output$inputValue <- renderText({c(input$weight, "lbs and", input$height, "inches.")})
    output$BMI        <- renderText({input$weight*0.4536 / (input$height*0.0254)^2})
    output$prediction <- renderText({-22.85937 + 1.65269*input$weight*0.4536 / (input$height*0.0254)^2})
    
    output$distPlot <- renderPlot({
        with(bodyfat, plot(y = bodyfat, x = BMI))
        points(x = input$weight*0.4536 / (input$height*0.0254)^2,
               y = -22.85937 + 1.65269*input$weight*0.4536 / (input$height*0.0254)^2, 
               col = "red", pch = 8,
               lwd=5)
    })
})