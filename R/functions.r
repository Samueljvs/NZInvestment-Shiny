##    Programme:  functions.r
##
##    Objective:  Generic functions for doing something
##
##      Author:   
##

##
##    Put functions in here
##



addSmallLegend <- function(myPlot, pointSize = 0.7, textSize = 8, spaceLegend = 1) {
    myPlot +
        guides(shape = guide_legend(override.aes = list(size = pointSize)),
               color = guide_legend(override.aes = list(size = pointSize))) +
        theme(legend.title = element_text(size = textSize), 
              legend.text  = element_text(size = textSize),
              legend.key.size = unit(spaceLegend, "lines"))
}

