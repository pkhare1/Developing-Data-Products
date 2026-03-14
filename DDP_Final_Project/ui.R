library(shiny)
shinyUI(fluidPage(
  titlePanel("Pratik Khare's Cricket Match Predictor Algorithm"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("opponent","Choose opponent",choices = c("Australia",
                                                            "England",
                                                            "South Africa",
                                                            "Pakistan",
                                                            "West Indies")),
      radioButtons("venue","Choose venue",choices = c("Home",
                                                     "Away",
                                                     "Neutral")),
      radioButtons("format","Choose format",choices = c("Test",
                                                        "ODI",
                                                        "T20"))
    ),
    mainPanel(
      h3("Predicted probability that India wins"),
      textOutput("winprob")
    )
  )
))