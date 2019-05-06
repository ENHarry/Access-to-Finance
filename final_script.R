# read in a sample to determine the variables are needed
library(data.table)
datasample <-  fread("hmda_lar2.csv", header = T,  nrows = 500000)

# write function to read in and clean data and partition it into desired parts
partMe <- function(x, y=4){
  require(caret)
  
  if (y == 4){
    inTrain <- createDataPartition(y = x$action_taken,
                                   p=0.5, list=FALSE)
    part1 <- x[inTrain,]
    part2 <- x[-inTrain,]
    rm(x, inTrain)
    
    inTrain <- createDataPartition(y = part1$action_taken,
                                   p=0.5, list=FALSE)
    p1 <- part1[inTrain,]
    p2 <- part1[-inTrain,]
    rm(part1, inTrain)
    
    inTrain <- createDataPartition(y = part2$action_taken,
                                   p=0.5, list=FALSE)
    p3 <- part2[inTrain,]
    p4 <- part2[-inTrain,]
    rm(part2, inTrain)
    
    result <- list(p1,p2,p3,p4)
    rm(p1,p2,p3,p4)
    return(result)
  }
  else if (y == 3){
    inTrain <- createDataPartition(y = x$action_taken,
                                   p=0.7, list=FALSE)
    part1 <- x[inTrain,]
    p1 <- x[-inTrain,]
    rm(x, inTrain)
    
    inTrain <- createDataPartition(y = part1$action_taken,
                                   p=0.5, list=FALSE)
    p2 <- part1[inTrain,]
    p3 <- part1[-inTrain,]
    rm(part1, inTrain)
    
    result <- list(p1,p2,p3)
    rm(p1,p2,p3)
    return(result)
  }
  else {
    return("Error, y must be either 3 or 4")
  }
}

to_numeric <- function(part4){
    
    part4$applicant_ethnicity <- as.numeric(part4$applicant_ethnicity)
    part4$applicant_income_000s <- as.numeric(part4$applicant_income_000s)
    part4$applicant_race_1 <- as.numeric(part4$applicant_race_1)
    part4$applicant_sex <- as.numeric(part4$applicant_sex)
    part4$as_of_year <- as.numeric(part4$as_of_year)
    
    part4 <- na.omit(part4)
    part4$co_applicant_ethnicity <- as.numeric(part4$co_applicant_ethnicity)
    part4$co_applicant_race_1 <- as.numeric(part4$co_applicant_race_1)
    part4$co_applicant_sex <- as.numeric(part4$co_applicant_sex)
    part4$hoepa_status <- as.numeric(part4$hoepa_status)
    part4$lien_status <- as.numeric(part4$lien_status)
    
    part4 <- na.omit(part4)
    part4$loan_purpose <- as.numeric(part4$loan_purpose)
    part4$msamd <- as.numeric(part4$msamd)
    part4$preapproval <- as.numeric(part4$preapproval)
    part4$purchaser_type <- as.numeric(part4$purchaser_type)
    
    part4$state_code <- as.numeric(part4$state_code)
    part4$hud_median_family_income <- as.numeric(part4$hud_median_family_income)

    part4 <- na.omit(part4)
    
    part4$loan_amount_000s <- as.numeric(part4$loan_amount_000s)
    part4$number_of_1_to_4_family_units <- as.numeric(part4$number_of_1_to_4_family_units)
    part4$number_of_owner_occupied_units <- as.numeric(part4$number_of_owner_occupied_units)
    part4$minority_population <- as.numeric(part4$minority_population)
    part4$population <- as.numeric(part4$population)
    part4$tract_to_msamd_income <- as.numeric(part4$tract_to_msamd_income)
    
    part4 <- na.omit(part4)
    
    part4$action_taken <- sapply(part4$action_taken, function(x) gsub("2", "1", x))
    part4$action_taken <- sapply(part4$action_taken, function(x) gsub("3", "0", x))
    
    se1 <- subset(part4, action_taken=="0"|action_taken=='1')
    rm(part4)
    return(se1)
  }

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

# set file location for the 2012 - 2016 data
file_link <- "hmda_lar.csv"

# the 2012 - 2016  data has 22,938,344 rows, read it through
dt <- Bigread(file_link, a=2, r=22938344) 

# save dt
save(dt, file = "dt.RData")

write.csv(dt, "data2012-2016.csv")

# filter by action taken in to 2 separate sets

approved12_16 <- subset(dt, action_taken=='1')
denied12_16 <- subset(dt, action_taken=='0')
rm(dt)

library(dplyr)

# create subsets by gender and year of previous subsets
approved12_f <- approved12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2012) %>% 
  sample_n(14000)
approved12_m <- approved12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2012)%>% 
  sample_n(14000)

approved13_f <- approved12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2013)%>% 
  sample_n(14000)
approved13_m <- approved12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2013)%>% 
  sample_n(14000)

approved14_f <- approved12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2014)%>% 
  sample_n(14000)
approved14_m <- approved12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2014)%>% 
  sample_n(14000)

approved15_f <- approved12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2015)%>% 
  sample_n(14000)
approved15_m <- approved12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2015)%>% 
  sample_n(14000)

approved16_f <- approved12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2016)%>% 
  sample_n(14000)
approved16_m <- approved12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2016)%>% 
  sample_n(14000)

p1 <- rbind(approved12_f,approved12_m)
rm(approved12_f,approved12_m)
p2 <- rbind(approved13_f,approved13_m)
rm(approved13_f,approved13_m)
p3 <- rbind(approved14_f,approved14_m)
rm(approved14_f,approved14_m)
p4 <- rbind(approved15_f,approved15_m)
rm(approved15_f,approved15_m)
p5 <- rbind(approved16_f,approved16_m)
rm(approved16_f,approved16_m)
df12_16 <- rbind(p1,p2)
rm(p1,p2)
df12_16 <- rbind(df12_16,p3)
rm(p3)
df12_16 <- rbind(df12_16,p4)
rm(p4)
df12_16 <- rbind(df12_16,p5)
rm(p5)

denied12_f <- denied12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2012) %>% 
  sample_n(12000)
denied12_m <- denied12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2012)%>% 
  sample_n(12000)

denied13_f <- denied12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2013)%>% 
  sample_n(12000)
denied13_m <- denied12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2013)%>% 
  sample_n(12000)

denied14_f <- denied12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2014)%>% 
  sample_n(12000)
denied14_m <- denied12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2014)%>% 
  sample_n(12000)

denied15_f <- denied12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2015)%>% 
  sample_n(12000)
denied15_m <- denied12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2015)%>% 
  sample_n(12000)

denied16_f <- denied12_16  %>% 
  filter(applicant_sex ==2 & as_of_year ==2016)%>% 
  sample_n(12000)
denied16_m <- denied12_16  %>% 
  filter(applicant_sex ==1 & as_of_year ==2016)%>% 
  sample_n(12000)

p1 <- rbind(denied12_f,denied12_m)
rm(denied12_f,denied12_m)
p2 <- rbind(denied13_f,denied13_m)
rm(denied13_f,denied13_m)
p3 <- rbind(denied14_f,denied14_m)
rm(denied14_f,denied14_m)
p4 <- rbind(denied15_f,denied15_m)
rm(denied15_f,denied15_m)
p5 <- rbind(denied16_f,denied16_m)
rm(denied16_f,denied16_m)
df07_11 <- rbind(p1,p2)
rm(p1,p2)
df07_11 <- rbind(df07_11,p3)
rm(p3)
df07_11 <- rbind(df07_11,p4)
rm(p4)
df07_11 <- rbind(df07_11,p5)
rm(p5)

# do the final merge for the 2012 to 2016 sample and then create the random partition
df12_16 <- rbind(df12_16,df07_11)
rm(df07_11)
save(df12_16, file = "df12_16.RData")


# the 2007 - 2011  data has 55,808,392 rows
file_link <- "hmda_lar2.csv"

# read in data
dt1 <- Bigread(file_link, a=4, r=27904196) 
dt2 <- Bigread(file_link, a=4, r=27904196, s=27904197)

# save the data sets
save(dt1, file = "dt1.RData")
save(dt2, file = "dt2.RData")

dt1 <- rbind(dt1, dt2)
rm(dt2)

write.csv(dt1, "data2007-2011.csv")

dt1_approved <- subset(dt1, action_taken=='1')
dt1_denied <- subset(dt1, action_taken=='0')

dt2_approved <- subset(dt2, action_taken=='1')
dt2_denied <- subset(dt2, action_taken=='0')

# save objects
save(dt1_approved, file = "dt1_approved.RData")
save(dt1_denied, file = "dt1_denied.RData")

save(dt2_approved, file = "dt2_approved.RData")
save(dt2_denied, file = "dt2_denied.RData")


# create subsets by gender and year of previous subsets
approved07_f <- approved07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2007) %>% 
  sample_n(14000)
approved07_m <- approved07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2007)%>% 
  sample_n(14000)

approved08_f <- approved07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2008)%>% 
  sample_n(14000)
approved08_m <- approved07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2008)%>% 
  sample_n(14000)

approved09_f <- approved07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2009)%>% 
  sample_n(14000)
approved09_m <- approved07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2009)%>% 
  sample_n(14000)

approved10_f <- approved07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2010)%>% 
  sample_n(14000)
approved10_m <- approved07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2010)%>% 
  sample_n(14000)

approved11_f <- approved07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2011)%>% 
  sample_n(14000)
approved11_m <- approved07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2011)%>% 
  sample_n(14000)

p1 <- rbind(approved07_f,approved07_m)
rm(approved07_f,approved07_m)
p2 <- rbind(approved08_f,approved08_m)
rm(approved08_f,approved08_m)
p3 <- rbind(approved09_f,approved09_m)
rm(approved09_f,approved09_m)
p4 <- rbind(approved10_f,approved10_m)
rm(approved10_f,approved10_m)
p5 <- rbind(approved11_f,approved11_m)
rm(approved11_f,approved11_m)
df07_11 <- rbind(p1,p2)
rm(p1,p2)
df07_11 <- rbind(df07_11,p3)
rm(p3)
df07_11 <- rbind(df07_11,p4)
rm(p4)
df07_11 <- rbind(df07_11,p5)
rm(p5)

denied07_f <- denied07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2007) %>% 
  sample_n(12000)
denied07_m <- denied07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2007)%>% 
  sample_n(12000)

denied08_f <- denied07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2008)%>% 
  sample_n(12000)
denied08_m <- denied07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2008)%>% 
  sample_n(12000)

denied09_f <- denied07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2009)%>% 
  sample_n(12000)
denied09_m <- denied07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2009)%>% 
  sample_n(12000)

denied10_f <- denied07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2010)%>% 
  sample_n(12000)
denied10_m <- denied07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2010)%>% 
  sample_n(12000)

denied11_f <- denied07_11  %>% 
  filter(applicant_sex ==2 & as_of_year ==2011)%>% 
  sample_n(12000)
denied11_m <- denied07_11  %>% 
  filter(applicant_sex ==1 & as_of_year ==2011)%>% 
  sample_n(12000)

p1 <- rbind(denied07_f,denied07_m)
rm(denied07_f,denied07_m)
p2 <- rbind(denied08_f,denied08_m)
rm(denied08_f,denied08_m)
p3 <- rbind(denied09_f,denied09_m)
rm(denied09_f,denied09_m)
p4 <- rbind(denied10_f,denied10_m)
rm(denied10_f,denied10_m)
p5 <- rbind(denied11_f,denied11_m)
rm(denied11_f,denied11_m)
df07_11_d <- rbind(p1,p2)
rm(p1,p2)
df07_11_d <- rbind(df07_11_d,p3)
rm(p3)
df07_11_d <- rbind(df07_11_d,p4)
rm(p4)
df07_11_d <- rbind(df07_11_d,p5)
rm(p5)

# do the final merge for the 2007 to 2011 sample and then create the random partition
df07_11 <- rbind(df07_11,df07_11_d)
rm(df07_11_d)

save(df07_11, file = "df07_11.RData")

 