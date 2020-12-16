library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel("Bodyfat Prediction App", windowTitle = "Bodyfat Prediction App"),

        sidebarPanel(
            h1('Input your measurement below!'),
            numericInput('age', 'Your age:', 30, min = 18, max = 60, step = 1),
            sliderInput('weight', 'Your weight (lbs):',
                        min = 80, max = 300, value = 150),
            sliderInput('height', 'Your height (inches):',
                        min = 50, max = 100, value = 70),
            submitButton('Submit')
        ),
        mainPanel(
            h2('What does this App do?'),
            h5('This app use your weight and height data to calculate your BMI and predict your bodyfat ratio using the bodyfat dataset.'),
            h2('Result of your bodyfat prediction:'),
            h3('You entered'),
            verbatimTextOutput("inputValue"),
            h3('You have a BMI of '),
            verbatimTextOutput("BMI"),
            h3('You have an estimated bodyfat of '),
            verbatimTextOutput("prediction"),
            plotOutput('distPlot')
        )
    )
)
