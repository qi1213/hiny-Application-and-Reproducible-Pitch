Developing Data Products Course Project: Shiny Application and Reproducible Pitch

author: Moci Fan date: 09/20/2021 autosize: true

Aim of this presentation

This presentation is created as part of the course project of the Developing Data Products course in the data science specialisation. The prject consists of the following two parts:


Instructions

This application is based on the course project of statistical inference class of the data science specialisation.

In that project, We investigate the exponential distribution in R and compare it with the Central Limit Theorem. More specificly, we study the distribution of 1000 averages of 40 exponentially distributed variables with lambda equal to 0.2.

Input & Output

In this application, we are able to change the number of simulations (e.g. 1000), the number of exponentials we generate in each simulation (e.g. 40), the rate parameter lambda (e.g. 0.2), and the seed we use for randomnisation. The user can choose whether or not to show the sample mean on the plot.

Outputs include two plots and comparison of theoretical and sample mean and variance.

Application Interface

App Interface

Simplified example code of the sample mean calculation in the server

set.seed(input$seed)
lambda <- input$sliderLambda
nosim <- input$sliderNsim
n <- input$sliderNmean
        
mns = NULL
for (i in 1 : nosim) mns = c(mns, mean(rexp(n,lambda)))
sampleMean <- mean(mns)
theoMean <- 1/lambda
rbind(sampleMean, theoMean)
               [,1]
sampleMean 4.974239
theoMean   5.000000
