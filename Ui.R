library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

shinyUI(fluidPage(
  titlePanel("Build your own Recommender System!"),
  fluidRow(
    column(10,
      wellPanel(
        tags$a(class="btn btn-default", href="https://docs.google.com/document/d/1oMKsXVu8SSwb2qFq1bzH7Oh_FsTl0n4fMeoOpcEYjYU/pub", "Instructions", target="_blank"),
        tags$a(class="btn btn-default", href="https://docs.google.com/document/d/1oMKsXVu8SSwb2qFq1bzH7Oh_FsTl0n4fMeoOpcEYjYU/pub", "Get the code for this site", target="_blank"),
        textInput("SpreadsheetId", "Copy here the link to your spreadsheet", value = "http..."),
        h4("As an example, you can try my recommender system, by rating first some movies: "),
        tags$a(class="btn btn-default", href="https://docs.google.com/forms/d/e/1FAIpQLSfWtcEIJA42NfGbtMfBL2bpfpWKihhEFbmGStgSEJlL2QoYbA/viewform?usp=send_form", "Rate Movies!",target="_blank"),
        h4("And then simply copy and paste this link in the text box above:"),
        h6("https://docs.google.com/spreadsheets/d/1VlgpWYzetcwrwW877rXP0KKC_EOKzaqFl8zWVJiMs5A/edit?usp=sharing"),
        h4("Then just write your username in the textbox below and ask for recommendations using any of the methods!")
        
           
        #tags$a(class="btn btn-default", href="https://docs.google.com/spreadsheets/d/1VlgpWYzetcwrwW877rXP0KKC_EOKzaqFl8zWVJiMs5A/pubhtml", "See User Ratings",target="_blank")
      )),
      column(4,
        textInput("username", "What is your username?"),
        sliderInput("n_recoms", "Number of Recomendations",1,10,1),
        selectInput("method", "Select Method", choices=c("Popular", "Random","Rerecommend","UBCF", "IBCF"), selected = "Popular"),
        actionButton("actionRecommend","Recommend!"),
        h6("Here is a link to other recommender systems, where you can also add your own so that others can use it too"),
        tags$a(class="btn btn-default", href="https://docs.google.com/spreadsheets/d/1wqBHVf-onqUWglbC4H1YZChyWK68uFYpnrn_jjn4iyM/edit?usp=sharing", "Open Recommender's dataset",target="_blank")
      ),
     mainPanel(verbatimTextOutput("R1")
               
               )
    )
  )
)
        
        
