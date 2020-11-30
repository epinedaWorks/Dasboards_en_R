#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyr)
library(DT)
library(readxl)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    ds_violencia <- read_excel("vioGT.xlsx",sheet=1)
    
    
    output$distPlot <- renderPlot({
        
        # generate bins based on input$bins from ui.R
        x <- round(ds_violencia$`Física - sexual`,2)*10
        bins <- seq(min(x), max(x), length.out = input$bins + 0.05)
        
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        
        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        # ggplot(data=ds_violencia, aes_string(x="Año",y=ds_violencia$`Física - sexual`))  +
        #     stat_summary(fun.y = sum, geom = "bar",colour="#56B4E9",fill="#56B4E9") +
        #     geom_bar(stat="identity") +
        #     # labs(title=input$Diseases, y ="Number") +
        #     theme_classic() +
        #     theme(plot.title = element_text(hjust = 0.5))
        # 
        
        
    })
    
    output$tablaPaisesCA <- DT::renderDT({
        datatable(ds_violencia,filter="none")
        
    }) ##FIN output$general
    
    
    
    
})
