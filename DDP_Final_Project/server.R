library(shiny)
library(readxl)
library(nnet)

data <- read_excel("data/Ind vs opponent results.xlsx")
df <- subset(data, Result != "NR")
df$Result <- factor(df$Result)
df$Opponent <- factor(df$Opponent)
df$Venue <- factor(df$Venue)
df$Format <- factor(df$Format)
df$Result[df$Result %in% c("Tied","Draw")] <- "Draw"
df$Result <- droplevels(df$Result)

model <- multinom(Result ~ Opponent + Venue + Format, data = df)

shinyServer(function(input, output) {
  output$winprob <- renderText({
    new.data <- data.frame(
      Opponent = input$opponent,
      Venue = input$venue,
      Format = input$format
    )
    pred <- predict(model, new.data, type ="probs")
    paste0(round(pred["Win"]*100,2), "%")
  })
})
