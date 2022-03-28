## Create A shiny dashbaord for the PSTIC

## Desripiton: This will be a test run 
##
## Author: Sam Verevis

## this is the resource used https://mastering-shiny.org/basic-app.html 

## load packages and Data
##
    library(readr)
    library(ggplot2)
    library(stringr)
    library(lubridate)
    library(stringi)
	  library(dplyr)
	  library(tidyr)
	  library(ggthemes)
	  library(purrr)
	  library(viridis)
	  library(forcats)
	  library(hrbrthemes)
	  library(treemap)
	  library(knitr)
	  library(rmarkdown)
	  library(cowplot)
	  library(shiny)	
	  library(janitor)

   ##    Set working directory
   ##
      setwd("C:/R-Work/NZInvestment-Shiny")

      invest_df <- readRDS("Data_Intermediate/direct_invest.RDS")


    ## Client side set-up UX
        ui <- fluidPage(

        # Application title
        titlePanel("New Zealand Investment Data"),

        # Sidebar with a slider input for number of bins 
        sidebarLayout(
            sidebarPanel(
                sliderInput(inputId = "rngID",
                            label = "Year to March",
                            min = min(invest_df$year),
                            value = c(2001, 2021),
                            max = max(invest_df$year),
                            sep = ""
                        ),
                selectInput(inputId = "directID",
                            label = "Direction of Direct Investment",
                            choices = distinct(invest_df, direction),
                            selected = " NZ's direct inv. abroad",
                            multiple = FALSE
                        ),
                selectInput(inputId = "countryID",
                            label = "Country",
                            choices = distinct(invest_df, country),
                            selected = "Total",
                            multiple = TRUE
                        )
                ),

            # Show a plot of the generated distribution
            mainPanel(
            downloadButton(outputId = "download_data", label = "Download"),
            plotOutput("investplot")
                )
            )
        )

    ## Define server logic required to draw a histogram
        server <- function(input, output) {

            selected_df <- reactive(invest_df %>%
                                        filter(year >= input$rngID[1] & year <= input$rngID[2], 
                                            direction == input$directID,
                                            country %in% input$countryID))


            output$investplot <- renderPlot({
                selected_df() %>%
                    ggplot(aes(year, value, col = country)) +
                        geom_line()
            })

        output$download_data <- downloadHandler(
            # The downloaded file is named "gapminder_data.csv"
            filename = "NZ_directInvestment.csv",
            content = function(file) {
                data = invest_df
                write.csv(data, file, row.names = FALSE)
            }
        )

        }


# Run the application 
shinyApp(ui = ui, server = server)

		
