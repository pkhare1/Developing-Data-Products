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
      textOutput("winprob"),
      
      hr(),
      
      h4("How to use this app"),
      p("Select an opponent, venue, and match format from the panel on the left.
     The app will predict the probability of India winning based on historical results."),
      
      h4("About the model"),
      p("Predictions are generated using a", strong("multinomial logistic regression model"), 
     "trained on historical India match results across Test, ODI, and T20 formats."),

     h4("The Model"),
     p("The following regression model is fit to the data:"),
     code("Result ~ Opponent + Venue + Format"),
     
     br(),
     p("In mathematical terms, for each outcome class k (Win, Loss, Draw):"),
     
     withMathJax(),
     helpText("$$\\log\\frac{P(Result = k)}{P(Result = \\text{ref})} = 
            \\beta_0 + \\beta_1 \\cdot Opponent + 
            \\beta_2 \\cdot Venue + 
            \\beta_3 \\cdot Format$$"),
     
     h4("Interpretation"),
     p("The model estimates the probability of each outcome (Win / Loss / Draw) 
     given the opponent, venue, and format. The predicted probability of a 
     ", strong("Win"), " is displayed above."),     
           
      h4("Data source"),
      p("Match results data sourced from ESPN Cricinfo, covering India's international
     matches across all formats and venues."),
    )
  )
))