#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyr)
library(DT)
library(shinythemes)

#setwd("/home/rstudio/ShinyApps/Dashboard_ViolenciaGT")

ds_violencia <- read_excel("vioGT.xlsx")


# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("cerulean"),
    
    h4("Estudiante: Erick J. Pineda Amézquita"),
    h4("17012140"),
    tags$h4(
        
        tags$a(href="https://www.ine.gob.gt/ine/estadisticas/bases-de-datos/violencia-intrafamiliar/", "La siguiente información se puede encontrar en el sitio del INE, click aqui para acceder", size=20, align="center")  
        ,align = "center"
    ),
    titlePanel("Análisis de Violencia en Guatemala"),
    img(src="/home/rstudio/ShinyApps/Dashboard_ViolenciaGT/violencia.jpg", align = "center"),
    # pre("La violencia constituye un problema de salud pública. La Organización Mundialde la Saludconsidera que existe una epidemia en términos sanitarios cuando se da una tasa superior a los diez  homicidios por cada 100.000 habitantes en un período de un año (OMS, 2002). En Guatemala esa tasa se encuentra en el orden de los 40 homicidios, con un índice de 13 muertes violentas diarias promedio. De mantenerse esta tendencia, en los primeros 25 años luego de la firma de los Acuerdos de Paz en 1996 que pusieron fin a una guerra que, según el Informe de la Comisiónpara el Esclarecimiento Histórico, costó la vida a alrededor de 250.000 personas (CEH, 1998), el número de muertos superará al registrado en esas casi cuatro décadas de enfrentamiento armado, período en el que el promedio de muertes diarias era de diez. "),
    p("La violencia constituye un problema de salud pública. La Organización Mundialde la Saludconsidera que existe una epidemia en términos sanitarios cuando se da una tasa superior a los diez  homicidios por cada 100.000 habitantes en un período de un año (OMS, 2002). En Guatemala esa tasa se encuentra en el orden de los 40 homicidios, con un índice de 13 muertes violentas diarias promedio. De mantenerse esta tendencia, en los primeros 25 años luego de la firma de los Acuerdos de Paz en 1996 que pusieron fin a una guerra que, según el Informe de la Comisiónpara el Esclarecimiento Histórico, costó la vida a alrededor de 250.000 personas (CEH, 1998), el número de muertos superará al registrado en esas casi cuatro décadas de enfrentamiento armado, período en el que el promedio de muertes diarias era de diez. "),
    
    br(),br(),
    h3("Histograma por agresión física sexual"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Agresión Física - sexual:",
                        min = 0,#0.15,
                        max = 10,#0.27,
                        value = 5)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Graficas", 
                                 plotOutput("distPlot")
                                 
                                 ),
                        
                        tabPanel("Carga de datos", 
                                 DT::DTOutput("tablaPaisesCA") 
                                 
                                 ),
                        tabPanel("Series de tiempo", tableOutput("table"))
            )
            
            
            # 
            # tabItems(
            # tabItem(tabName = "OtrosPaises",
            #         h1("Sección Internacional",align="center")
            #         
            # ))
            # ,
            
       
            
            
        )
    )
))
