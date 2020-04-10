#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

require(shiny)
data("Titanic")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    titlePanel("Predict Survival from Titanic based on Class"),
    sidebarLayout(
        sidebarPanel(
            selectInput("class", "Class:",
                        c("First Class" = "1",
                          "Second Class" = "2",
                          "Third Class" = "3")
        ),
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Likelihood of Survival"),
            textOutput("pred1")
        )
    )
))
