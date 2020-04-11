#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(shiny)
require(dplyr)
require(ggplot2)
require(titanic)
require(rsconnect)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    data("titanic_train", package="titanic")
    WorkingData <- as.data.frame(titanic_train) %>%
        mutate(Sex = as.factor(Sex)) %>%
        mutate(factorSurvived = if_else(Survived == 1,
                                        "Survived", "Died"))

    output$plot1 <- renderPlot({
        classInput <- input$class
        Subdata <- WorkingData %>% 
            filter(Pclass == classInput)
        qplot(factorSurvived, data = Subdata, fill = Sex) +
            geom_bar()
    })
    
    output$pred1 <- renderText({
        classInput <- input$class
        Subdata <- WorkingData %>% 
            filter(Pclass == classInput)
        mean(Subdata$Survived)
    })
    
})
