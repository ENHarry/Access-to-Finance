Bigread <- function(x, a =NULL, r =NULL, s =NULL){
library(data.table)  
if (is.null(a)==TRUE){
    if (is.null(r)==TRUE) {
      if (is.null(s)==TRUE) {
        part4 <-  fread(x, header = T, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78))
        
        set1 <- to_numeric(part4)
        
        return(set1)
        
      }
      else{
        part4 <-  fread(x, header = F, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                        col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                      "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                      "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                      "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                      "state_code", "hud_median_family_income", "loan_amount_000s", 
                                      "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                      "minority_population", "population", "tract_to_msamd_income" ))
        
        set1 <- to_numeric(part4)
        
        return(set1)
        
      }
      
    }
    else{
      if (is.null(s)==TRUE) {
        part4 <-  fread(x, header = T, nrows = r, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78))
        
        set1 <- to_numeric(part4)
        
        return(set1)
        
      }
      else{
        part4 <-  fread(x, header = F, nrows = r, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                        col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                      "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                      "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                      "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                      "state_code", "hud_median_family_income", "loan_amount_000s", 
                                      "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                      "minority_population", "population", "tract_to_msamd_income" ))
        
        set1 <- to_numeric(part4)
        
        return(set1)
        
      }
    }
  }
  else{
    if (is.null(r)==TRUE) {
      if (is.null(s)==TRUE) {
        part4 <-  fread(x, header = T, select = c(1))
        r <- nrow(part4)
        s = 0
        se <- data.frame()
        for(i in 1:a){
          part4 <-  fread(x, header = F, nrows = r/a, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                          col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                        "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                        "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                        "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                        "state_code", "hud_median_family_income", "loan_amount_000s", 
                                        "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                        "minority_population", "population", "tract_to_msamd_income" ))
          set1 <- to_numeric(part4)
          rm(part4)
          se <- rbind(set1, se)
          rm(set1)
          s <- ((r/a)*i) + 1
          
        }
        
        return(se)
        
      }
      else{
        part4 <-  fread(x, header = T, select = c(1))
        r <- nrow(part4)
        se <- data.frame()
        for(i in 1:a){
          part4 <-  fread(x, header = F, nrows = r/a, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                          col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                        "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                        "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                        "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                        "state_code", "hud_median_family_income", "loan_amount_000s", 
                                        "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                        "minority_population", "population", "tract_to_msamd_income" ))
          set1 <- to_numeric(part4)
          rm(part4)
          se <- rbind(set1, se)
          rm(set1)
          s <- ((r/a)*i) + 1
          
        }
        
        return(se)
        
      }
      
    }
    else{
      if (is.null(s)==TRUE) {
        s = 0
        se <- data.frame()
        for(i in 1:a){
          part4 <-  fread(x, header = F, nrows = r/a, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                          col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                        "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                        "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                        "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                        "state_code", "hud_median_family_income", "loan_amount_000s", 
                                        "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                        "minority_population", "population", "tract_to_msamd_income" ))
          set1 <- to_numeric(part4)
          rm(part4)
          se <- rbind(set1, se)
          rm(set1)
          s <- ((r/a)*i) + 1
          
        }
       
        return(se)
        
      }
      else{
        se <- data.frame()
        for(i in 1:a){
          part4 <-  fread(x, header = F, nrows = r/a, skip = s, select = c(1,3,6,8,9,19,22,24,26,36,48,50,52,56,60,64,66,68,71:76,78),
                          col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                        "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", 
                                        "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", 
                                        "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id",  
                                        "state_code", "hud_median_family_income", "loan_amount_000s", 
                                        "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                        "minority_population", "population", "tract_to_msamd_income" ))
          set1 <- to_numeric(part4)
          rm(part4)
          se <- rbind(set1, se)
          rm(set1)
          s <- ((r/a)*i) + 1
          
        }
        
        return(se)
        
        
      }
      
    }
    
  }
}

# the 2007 - 2011  data has 55,808,392 rows
file_link <- "hmda_lar2.csv"

# read in data
dt1 <- Bigread(file_link, a=4, r=27904196) 
dt2 <- Bigread(file_link, a=4, r=27904196, s=27904197)

# save objects
save(dt1, file = "dt1.RData")
save(dt2, file = "dt2.RData")

dt1_approved <- subset(dt1, action_taken=='1')
dt1_denied <- subset(dt1, action_taken=='0')

dt2_approved <- subset(dt2, action_taken=='1')
dt2_denied <- subset(dt2, action_taken=='0')

# save objects
save(dt2_approved, file = "dt2_approved.RData")
save(dt2_denied, file = "dt2_denied.RData")

# the 2012 - 2016  data has 22,938,344 rows
file_link <- "hmda_lar.csv"

# read in data
dt <- Bigread(file_link, a=2, r=22938344) 