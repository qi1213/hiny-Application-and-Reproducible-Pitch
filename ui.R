library(shiny)
library(markdown)
shinyUI(fluidPage(
    titlePanel("Investigation of Exponential Distribution"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderLambda", "What is the lambda of the distribution?",
                        0.1, 2, value = 0.2, step = 0.1),
            sliderInput("sliderNsim", "How many simulations do you want to conduct?",
                        500, 2000, value = 1000, step = 100),
            sliderInput("sliderNmean", "How many exponentials do you want to take average from in each simulation?",
                        5, 100, value = 40, step = 5),
            numericInput("seed", "Input the seed for randomnization", 
                         value = 1234, min = 1, max = 9999, step = 1),
            
            checkboxInput("showSampleMean", "Show/Hide Sample Mean", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Results",
                                 h3("Exponential Distribution"),
                                 plotOutput("plot1"),
                                 h3("Distribution of the Mean"),
                                 plotOutput("plot2"),
                                 h3("Theoretical Mean:"),
                                 textOutput("theoMean"),
                                 h3("Sample Mean:"),
                                 textOutput("sampleMean"),
                                 h3("Theoretical Variance:"),
                                 textOutput("theoVar"),
                                 h3("Sample Variance:"),
                                 textOutput("sampleVar")),
                        tabPanel("Instructions",
                                 mainPanel(
                                     includeMarkdown("include.md")
                                 ))
            )
        )
    )
))
