##    Programme:  themes.r
##
##    Objective:  Graphical themes for Ministry of Health
##
##      Author:   James Hogan, Sense Parters, 29 January 2020
##

#------------------MoH Colour Palette-------------------------

# Create a vector to store the colours
MoH_Colours <- c(
   Navy_Blue  = rgb(35,  48, 93,  maxColorValue=255),
   Orange     = rgb(241,135,  0,  maxColorValue=255),
   Gold       = rgb(250,185,  0,  maxColorValue=255),
   Red        = rgb(232, 65, 36,  maxColorValue=255),
   Dark_Red   = rgb(176, 24, 43,  maxColorValue=255),
   Crimson    = rgb(232, 38,138,  maxColorValue=255),
   Purple     = rgb(112, 36,123,  maxColorValue=255),
   Blue       = rgb(10, 106,180,  maxColorValue=255),
   Light_Blue = rgb(0,  156,222,  maxColorValue=255),
   Weird_Blue = rgb(0,  154,147,  maxColorValue=255),
   Olive      = rgb(132,161, 19,  maxColorValue=255),
   Green      = rgb(0,  127, 50,  maxColorValue=255)
)

# Create a function for easy reference to combinations of MoH_Colours
MoHColours <- function(x=1:12){
   if(x[1]=="Duo1")  x <- c(1,5)
   if(x[1]=="Duo2")  x <- c(5,7)
   if(x[1]=="Duo3")  x <- c(4,7)
   if(x[1]=="Duo4")  x <- c(1,4)
   if(x[1]=="Duo5")  x <- c(1,2)
   if(x[1]=="Duo6")  x <- c(1,8)
   if(x[1]=="Trio1") x <- c(1,3:4)
   if(x[1]=="Trio2") x <- c(1,4,6)
   if(x[1]=="Trio3") x <- c(3,5,7)
   if(x[1]=="Trio4") x <- c(1,4,8)
   if(x[1]=="Quad1") x <- c(1,3,5,8)
   if(x[1]=="Quad2") x <- c(2,4,6,8)
   as.vector(MoH_Colours[x])
}
