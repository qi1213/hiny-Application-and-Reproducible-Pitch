library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    
    getExpoMeans <- reactive({
        set.seed(input$seed)
        lambda <- input$sliderLambda
        nosim <- input$sliderNsim
        n <- input$sliderNmean
        
        mns = NULL
        for (i in 1 : nosim) mns = c(mns, mean(rexp(n,lambda)))
        mns
    })
    
    sampleMeanCalc <- reactive({
        mns <- getExpoMeans()
        mean(mns)
    })
    
    sampleVarCalc <- reactive({
        mns <- getExpoMeans()
        var(mns)
    })
    
    output$plot1 <- renderPlot({
        lambda <- input$sliderLambda
        nosim <- input$sliderNsim

        # Generate nosim exponentially distributed numbers
        expseq <- rexp(nosim,lambda)
        # Plot the distribution of these numbers
        ggplot(data.frame(expseq),aes(x=expseq)) + 
            geom_histogram(aes(y=..density..), bins=30, colour="black",fill="white")
    })
    
    output$plot2 <- renderPlot({
        mns <- getExpoMeans()
        
        g <- ggplot(data.frame(mns),aes(x=mns)) +
            geom_histogram(aes(y=..density..), bins=30, colour="black", fill="white")
        
        if(input$showSampleMean){
            g <- g + geom_vline(aes(xintercept=mean(mns)), color="red", size=1)
        }
        g
    })
    
    output$theoMean <- renderText({
        1/input$sliderLambda
    })

    output$theoVar <- renderText({
        lambda <- input$sliderLambda
        n <- input$sliderNmean
        (1/lambda)^2/n
    })

    output$sampleMean <- renderText({
        sampleMeanCalc()
    })

    output$sampleVar <- renderText({
        sampleVarCalc()
    })
})
