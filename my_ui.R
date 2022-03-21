library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
library(reshape2)

BN_mentees <- read.csv("https://raw.githubusercontent.com/nlin7001/Building-Networks-2022/main/BN_mentees.csv")


#Plot 1 


BN_mentees <- BN_mentees %>% 
  rename(Majors = What.focus.are.you.interested.in.within.Business...Please.select.1.2.options., 
         Names = First.and.Last.Name
  )

majors <- BN_mentees %>%  
  select(Names, Majors)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(bootswatch = "cerulean"),
            HTML("<h3>Project Introduction and Information about the Climate Dataset</h3>
            <img src=\"https://foster.uw.edu/wp-content/uploads/2020/08/2020-Full-Cohort-1140x743.png\" alt=\"Building Networks Team 2021\">
                 <p>For our final project, we have decided to look at climate change, its causes and effects, and how it realtes to different countries around the world. Our main focus was comparing how each countries contributes to climate change and how it affects other countries.</p>"), 
            p(textOutput(outputId = "Intro")),
            p(textOutput(outputId = "Value")),
            tags$style(
              "img {
                width: 70%;
                height: auto;
              }"
            )
  )
)


plot_sidebar_1 <- sidebarPanel(
  numericInput(
    inputId = "user_year",
    label = "Select Year",
    value = 1990, 
    min = 1990, 
    max = 2005, 
    step = 5), 
)

plot_main_1 <- mainPanel(
  plotlyOutput(outputId = "co2Plot"), 
)


plot_tab_1 <- tabPanel(
  "CO2 vs. Population",
  sidebarLayout(
    plot_sidebar_1,
    plot_main_1)
)


plot_sidebar_2 <- sidebarPanel(
  selectInput(
    inputId = "user_country",
    label = "Select Country",
    choices = climate_df$Country.name,
    selected = "United States",
    multiple = TRUE
  )
)



plot_main_2 <- mainPanel(
  plotlyOutput(outputId = "droughtsPlot")
)

plot_tab_2 <- tabPanel(
  "Natural Disasters",
  sidebarLayout(
    plot_sidebar_2,
    plot_main_2
  )
)


plot_sidebar_3 <- sidebarPanel(
  selectInput(
    inputId = "user_chosen",
    label = "Select Country",
    choices = CO2_GDP_melt$Country.name,
    selected = "United States",
    multiple = TRUE
  )
)


plot_main_3 <- mainPanel(
  plotlyOutput(outputId = "CO2_GDP_Plot")
)

plot_tab_3 <- tabPanel(
  "CO2 emissions per units of GDP",
  sidebarLayout(
    plot_sidebar_3,
    plot_main_3
  )
)

conclude_tab <- tabPanel(
  "Outro", 
  fluidPage(theme = bs_theme(bootswatch = "cerulean"),
            p("Conclusion")
  )
)

ui <- navbarPage(
  "Climate Change",
  intro_tab,
  plot_tab_1, 
  plot_tab_2,
  plot_tab_3,
  conclude_tab
)
