##    Programme:  Spartica Utilisation Report
##
##    Objective:  This programme will look to do analysis of pacific countries utilisaiton of different preferences under
##
##    Plan of  :  The strucutre of the session, will be to show you how some of the data looks, and then perfrom some analysis
##    Attack   : 
##
##    Author   :  Sam Verevis, 9/21/2021
##
   ##
   ##    Clear the decks and load up some functionality
   ##
      rm(list=ls(all=TRUE))
      
   ##
   ##    Core libraries
   ##
	  library(readr)
      library(ggplot2)
      library(stringr)
      library(lubridate)
      library(stringi)
	  library(dplyr)
	  library(tidyr)
	  library(ggthemes)
	  library(purrr)
	  library(viridis)
	  library(forcats)
	  library(hrbrthemes)
	  library(treemap)
	  library(knitr)
	  library(rmarkdown)
	  library(cowplot)
	 	
   ## 
   ##    Set working directory
   ##
      setwd("C:\\R Work\\Utilisation\\")
	  
	  
	  ## First programme builds the required data and graphics
	  ## The seoncd will be an R-markdown file, which will use the first one to build the report with all the needed graphs, tables and drafted words
	  
	  source("Programmes/Mod_1_Analysis.r")

	  render('Programmes/Sparteca_Note.Rmd', output_dir = "Product_Output")
		
		
##
##   End of programme
##
