## Create A shiny dashbaord for the PSTIC

## Desripiton: This will be a test run 
##
## Author: Sam Verevis

## this is the resource used https://mastering-shiny.org/basic-app.html 

## load packages and Data
##
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
           plotOutput("investplot")
            )
        )
    )



# Define server logic required to draw a histogram
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
}


# Run the application 
shinyApp(ui = ui, server = server)

		
