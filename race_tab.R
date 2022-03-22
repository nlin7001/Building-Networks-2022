race_tab <- tabPanel(
  "BN Race/Ethnicity", 
  fluidPage(theme = bs_theme(bootswatch = "cerulean"),
            HTML("<h3>Building Networks 2022</h3>
            <img src=\"http://127.0.0.1:30732/graphics/b1eb192c-6bc3-435f-89b3-052ef57b3810.png\" alt=\"Building Networks Team 2021\">
                 <p>Diversity!</p>"), 
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