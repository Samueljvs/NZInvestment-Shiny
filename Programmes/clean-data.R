##    Programme:  Clean StatsNZ data
##
##    Objective:  This programme will clean raw data download of NZ-country stock of direct investment from StatsNZ
##
##    Plan of  :  
##    Attack   : 
##
##    Author   :  Sam Verevis, 3/28/2022
##
    ## Load raw country direct investment data
    ##
        raw_df <- read_csv("Data_Raw/IIP456201_20220328_101307_67.csv", skip = 2) %>%
                    filter(!row_number() %in% 22:50) %>%
                    rename(year = 1) %>%
                    select(-3) %>%
                    mutate(across(everything(), ~ as.numeric(str_replace_all(.x, "[..]", "0")))) %>%
                    pivot_longer(cols = -year,
                                 names_to = "to_sort"
                    ) %>%
                    separate(col = to_sort,
                             into = c("rem", "direction", "rem2", "country"),
                             sep = ";") %>%
                    select(-c(rem, rem2)) %>%
                    mutate(country = ifelse(is.na(country), "Total", country),
                           direction = str_replace(direction, " total", ""))

        saveRDS(raw_df, file = "Data_Intermediate/direct_invest.RDS")
