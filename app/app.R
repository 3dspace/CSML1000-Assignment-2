#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr);
library(ggplot2);
library(knitr);
library(validate);
library(tidyverse);  # data manipulation
library(cluster); 
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Credit Card Dataset"),

    # Sidebar with a slider input for number of bins 
    #BALANCE  PURCHASES ONEOFF_PURCHASES INSTALLMENTS_PURCHASES CASH_ADVANCE CREDIT_LIMIT
    sidebarLayout(
        sidebarPanel(
            helpText("Please provide the inputs:"),
            numericInput(inputId="balance", label="Balnace", value=0, min=0),
            numericInput(inputId="purchases", label="Purchases", value=0, min=0),
            numericInput(inputId="oneoff", label="One Off Purchases", value=0, min=0),
            numericInput(inputId="installments", label="Installments Purchases", value=0, min=0),
            numericInput(inputId="cash", label="Cash Advance", value=0, min=0),
            numericInput(inputId="credit", label="Credit Limit", value=0, min=0),
            actionButton(inputId="submit", label="Predit")
        ),
        
        

        # Show a plot of the generated distribution
        mainPanel(
            helpText("Below is the predict value from our model"),
            textOutput("predictVal")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    model2 <- readRDS("./CreditCardBehaviour6Clusters-2.rda")
    observeEvent(input$submit, {
        finalVal = input$balance + input$purchases + input$oneoff + input$installments + input$cash + input$credit
        print("hello")
        output$predictVal <- renderText({finalVal})
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
