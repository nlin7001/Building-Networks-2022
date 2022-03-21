library(ggplot2)
library(plotly)
library(dplyr)
library(reshape2)

BN_mentees <- read.csv("https://raw.githubusercontent.com/nlin7001/Building-Networks-2022/main/BN_mentees.csv")

server <- function(input, output) {


  
  #Chart 1: Majors
  
  output$all_majors <- renderPlotly({
    
    # Allow user to filter by multiple countries and years
    majors <- majors %>%
      filter(First.and.Last.Name %in% input$user_chosen)
    
    # Make a scatter plot of co2 per capita over time by country
    my_plot <- ggplot(data = majors, aes(x = "", y = ) ) +
      geom_bar(aes(x = Year, y = value, color = Country.name)) +
      labs(
        title = "CO2 emissions per units of GDP",
        x = "Year", 
        y = "kg per $1,000 GDP (2005 PPP$)"
      ) +
      scale_colour_discrete("Country")
    
  })
  
}