library(recommenderlab)
library(googlesheets)

shinyServer(function(input, output, session) {
  
     getRecommendations<-function(recom_matrix,allUsers,meth,user,n_recs){
          model<-Recommender(recom_matrix,meth)
          recom<-predict(model,recom_matrix,n=n_recs)
          recommendationList<-as(recom,'list')
          return(recommendationList[allUsers==user])
     }
     
     
     getData<-function(){
          ss <- gs_url(input$SpreadsheetId, lookup = FALSE, visibility = "public")
          GoogleDoc<-gs_read(ss)
          GoogleDocMat<-as.matrix(GoogleDoc[,-1])
          class(GoogleDocMat)<-"numeric"
          r2 <- as(GoogleDocMat, "realRatingMatrix")          
          return(list(allUsers=GoogleDoc[,2],recommatrix=r2))
     }
     
     
     validUser<-function(data,user){
          return(user %in% as.matrix(data$allUsers))
     }
     
          
     Recommend<-eventReactive(input$actionRecommend,{
          data<-getData()
          if(validUser(data,input$username)){
               recoms<-getRecommendations(data$recommatrix, data$allUsers,input$method, input$username, input$n_recoms)
               paste("\t",recoms[[1]][1:input$n_recoms],"\n")
          }else{"User not found. Be sure to rate some items first."}
          })
     
     output$R1<-renderText({
          Recommend()       
          })
})