library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
library(reshape2)

BN_mentees <- read.csv("https://raw.githubusercontent.com/nlin7001/Building-Networks-2022/main/BN_Charts.csv")


#Plot 1 

majors <- BN_mentees %>%  
  select(Majors, Major_Value)



intro_tab <- tabPanel(
  "Welcome",
  fluidPage(theme = bs_theme(bootswatch = "cerulean"),
            HTML("<h3>Building Networks 2022</h3>
            <img src=\"https://foster.uw.edu/wp-content/uploads/2020/08/2020-Full-Cohort-1140x743.png\" alt=\"Building Networks Team 2021\">
                 <p>Hello Building Networks!</p>"), 
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
  selectInput(
    inputId = "user_chosen",
    label = "Select Major",
    choices = majors$Majors,
    selected = "Marketing",
    multiple = TRUE
  )
)

plot_main_1 <- mainPanel(
  plotlyOutput(outputId = "all_majors"), 
)


plot_tab_1 <- tabPanel(
  "BN 2022 majors",
  sidebarLayout(
    plot_sidebar_1,
    plot_main_1)
)



ui <- navbarPage(
  "Building Networks 2022",
  intro_tab,
  plot_tab_1
)
