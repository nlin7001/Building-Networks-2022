library(ggplot2)
library(plotly)
library(dplyr)
library(reshape2)

BN_mentees <- read.csv("~/Desktop/Building Networks 2022/BN_Charts_1.csv")

# Plot 1

majors <- BN_mentees %>%  
  select(Majors, Major_Value)


server <- function(input, output) {

  
  #Chart 1: Majors
  
  output$all_majors <- renderPlotly({
    
    majors <- majors %>%
      filter(Majors %in% input$user_chosen)
  
    my_plot_1 <- ggplot (majors) + 
      geom_col(mapping = aes(x = Majors, y = Major_Value, fill= Majors))+
      labs(title = 'BN Majors',
           x = 'Majors',
           y = 'People',
           fill = 'Majors') + 
      scale_fill_brewer(palette = "Set2")+
      scale_colour_discrete("Majors")
    
    my_plotly_plot1 <- ggplotly(my_plot_1)
    
    return (my_plotly_plot1)
    
  })
  
}