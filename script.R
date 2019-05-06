library("data.table")
library("dplyr")


datasample <- as.data.table(fread("hmda_lar.csv", header = T,  nrows = 500000))

part1 <- as.data.table(fread("part1.csv", header = T,  nrows = 500000, drop = c(1)))

part1 <- part2[1:13952098,]
part3 <- part2[13952099:27904196,]
part4 <- part2[27904197:41856294,]
part2 <- part2[41856295:55808392,]

part1$action_taken <- as.character(part1$action_taken)
part1$agency_code <- as.numeric(part1$agency_code)
part1$applicant_ethnicity <- as.numeric(part1$applicant_ethnicity)
part1$applicant_income_000s <- as.numeric(part1$applicant_income_000s)
part1$applicant_race_1 <- as.numeric(part1$applicant_race_1)
part1$applicant_sex <- as.numeric(part1$applicant_sex)
part1$application_date_indicator <- as.numeric(part1$application_date_indicator)
part1$census_tract_number <- as.numeric(part1$census_tract_number)
part1$co_applicant_ethnicity <- as.numeric(part1$co_applicant_ethnicity)
part1$co_applicant_race_1 <- as.numeric(part1$co_applicant_race_1)
part1$co_applicant_sex <- as.numeric(part1$co_applicant_sex)
part1$hoepa_status <- as.numeric(part1$hoepa_status)
part1$lien_status <- as.numeric(part1$lien_status)

part1$loan_purpose <- as.numeric(part1$loan_purpose)
part1$loan_type <- as.numeric(part1$loan_type)
part1$owner_occupancy <- as.numeric(part1$owner_occupancy)
part1$preapproval <- as.numeric(part1$preapproval)
part1$property_type <- as.numeric(part1$property_type)
part1$purchaser_type <- as.numeric(part1$purchaser_type)
part1$hud_median_family_income <- as.numeric(part1$hud_median_family_income)

part1$loan_amount_000s <- as.numeric(part1$loan_amount_000s)
part1$number_of_1_to_4_family_units <- as.numeric(part1$number_of_1_to_4_family_units)
part1$number_of_owner_occupied_units <- as.numeric(part1$number_of_owner_occupied_units)
part1$minority_population <- as.numeric(part1$minority_population)
part1$population <- as.numeric(part1$population)
part1$tract_to_msamd_income <- as.numeric(part1$tract_to_msamd_income)

comp_part1 <- part1[complete.cases(part1),]

comp_part1$action_taken <- gsub("2", "1", comp_part1$action_taken)
comp_part1$action_taken <- gsub("8", "1", comp_part1$action_taken)
comp_part1$action_taken <- gsub("3", "0", comp_part1$action_taken)
comp_part1$action_taken <- gsub("7", "0", comp_part1$action_taken)

part2 <- as.data.table(fread("part1.csv", header = F, skip = 500001,  nrows = 500000, 
                             drop = c(1), col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                                        "applicant_race_1", "applicant_sex",  "application_date_indicator", "as_of_year", 
                                                        "census_tract_number", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", 
                                                        "hoepa_status", "lien_status", "loan_purpose", "loan_type",  "owner_occupancy","preapproval",  
                                                        "property_type",  "purchaser_type", "respondent_id",  "state_code", "hud_median_family_income", 
                                                        "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                                        "minority_population", "population", "tract_to_msamd_income" )))


part2$agency_code <- as.numeric(part2$agency_code)
part2$applicant_ethnicity <- as.numeric(part2$applicant_ethnicity)
part2$applicant_income_000s <- as.numeric(part2$applicant_income_000s)
part2$applicant_race_1 <- as.numeric(part2$applicant_race_1)
part2$applicant_sex <- as.numeric(part2$applicant_sex)
part2$application_date_indicator <- as.numeric(part2$application_date_indicator)
part2$census_tract_number <- as.numeric(part2$census_tract_number)
part2$co_applicant_ethnicity <- as.numeric(part2$co_applicant_ethnicity)
part2$co_applicant_race_1 <- as.numeric(part2$co_applicant_race_1)
part2$co_applicant_sex <- as.numeric(part2$co_applicant_sex)
part2$hoepa_status <- as.numeric(part2$hoepa_status)
part2$lien_status <- as.numeric(part2$lien_status)

part2$loan_purpose <- as.numeric(part2$loan_purpose)
part2$loan_type <- as.numeric(part2$loan_type)
part2$owner_occupancy <- as.numeric(part2$owner_occupancy)
part2$preapproval <- as.numeric(part2$preapproval)
part2$property_type <- as.numeric(part2$property_type)
part2$purchaser_type <- as.numeric(part2$purchaser_type)
part2$hud_median_family_income <- as.numeric(part2$hud_median_family_income)

part2$loan_amount_000s <- as.numeric(part2$loan_amount_000s)
part2$number_of_1_to_4_family_units <- as.numeric(part2$number_of_1_to_4_family_units)
part2$number_of_owner_occupied_units <- as.numeric(part2$number_of_owner_occupied_units)
part2$minority_population <- as.numeric(part2$minority_population)
part2$population <- as.numeric(part2$population)
part2$tract_to_msamd_income <- as.numeric(part2$tract_to_msamd_income)

comp_part2 <- part2[complete.cases(part2),]
rm(part2)

comp_part2$action_taken <- gsub("2", "1", comp_part2$action_taken)
comp_part2$action_taken <- gsub("8", "1", comp_part2$action_taken)
comp_part2$action_taken <- gsub("3", "0", comp_part2$action_taken)
comp_part2$action_taken <- gsub("7", "0", comp_part2$action_taken)

part3 <- as.data.table(fread("part1.csv", header = F, skip = 1000001, 
                             drop = c(1), col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                                        "applicant_race_1", "applicant_sex",  "application_date_indicator", "as_of_year", 
                                                        "census_tract_number", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", 
                                                        "hoepa_status", "lien_status", "loan_purpose", "loan_type",  "owner_occupancy","preapproval",  
                                                        "property_type",  "purchaser_type", "respondent_id",  "state_code", "hud_median_family_income", 
                                                        "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                                        "minority_population", "population", "tract_to_msamd_income" )))


part3$action_taken <- gsub("2", "1", part3$action_taken)
part3$action_taken <- gsub("8", "1", part3$action_taken)
part3$action_taken <- gsub("3", "0", part3$action_taken)
part3$action_taken <- gsub("7", "0", part3$action_taken)

part3$action_taken <- as.character(part3$action_taken)
part3$agency_code <- as.numeric(part3$agency_code)
part3$applicant_ethnicity <- as.numeric(part3$applicant_ethnicity)
part3$applicant_income_000s <- as.numeric(part3$applicant_income_000s)
part3$applicant_race_1 <- as.numeric(part3$applicant_race_1)
part3$applicant_sex <- as.numeric(part3$applicant_sex)
part3$application_date_indicator <- as.numeric(part3$application_date_indicator)
part3$census_tract_number <- as.numeric(part3$census_tract_number)
part3$co_applicant_ethnicity <- as.numeric(part3$co_applicant_ethnicity)
part3$co_applicant_race_1 <- as.numeric(part3$co_applicant_race_1)
part3$co_applicant_sex <- as.numeric(part3$co_applicant_sex)
part3$hoepa_status <- as.numeric(part3$hoepa_status)
part3$lien_status <- as.numeric(part3$lien_status)

part3$loan_purpose <- as.numeric(part3$loan_purpose)
part3$loan_type <- as.numeric(part3$loan_type)
part3$owner_occupancy <- as.numeric(part3$owner_occupancy)
part3$preapproval <- as.numeric(part3$preapproval)
part3$property_type <- as.numeric(part3$property_type)
part3$purchaser_type <- as.numeric(part3$purchaser_type)
part3$hud_median_family_income <- as.numeric(part3$hud_median_family_income)

part3$loan_amount_000s <- as.numeric(part3$loan_amount_000s)
part3$number_of_1_to_4_family_units <- as.numeric(part3$number_of_1_to_4_family_units)
part3$number_of_owner_occupied_units <- as.numeric(part3$number_of_owner_occupied_units)
part3$minority_population <- as.numeric(part3$minority_population)
part3$population <- as.numeric(part3$population)
part3$tract_to_msamd_income <- as.numeric(part3$tract_to_msamd_income)

comp_part3 <- part3[complete.cases(part3),]
rm(part3)

comp_part3$action_taken <- gsub("2", "1", comp_part3$action_taken)
comp_part3$action_taken <- gsub("8", "1", comp_part3$action_taken)
comp_part3$action_taken <- gsub("3", "0", comp_part3$action_taken)
comp_part3$action_taken <- gsub("7", "0", comp_part3$action_taken)


part4$agency_code <- as.numeric(part4$agency_code)
part4$applicant_ethnicity <- as.numeric(part4$applicant_ethnicity)
part4$applicant_income_000s <- as.numeric(part4$applicant_income_000s)
part4$applicant_race_1 <- as.numeric(part4$applicant_race_1)
part4$applicant_sex <- as.numeric(part4$applicant_sex)
part4$application_date_indicator <- as.numeric(part4$application_date_indicator)
part4$census_tract_number <- as.numeric(part4$census_tract_number)
part4$co_applicant_ethnicity <- as.numeric(part4$co_applicant_ethnicity)
part4$co_applicant_race_1 <- as.numeric(part4$co_applicant_race_1)
part4$co_applicant_sex <- as.numeric(part4$co_applicant_sex)
part4$hoepa_status <- as.numeric(part4$hoepa_status)
part4$lien_status <- as.numeric(part4$lien_status)

part4$loan_purpose <- as.numeric(part4$loan_purpose)
part4$loan_type <- as.numeric(part4$loan_type)
part4$owner_occupancy <- as.numeric(part4$owner_occupancy)
part4$preapproval <- as.numeric(part4$preapproval)
part4$property_type <- as.numeric(part4$property_type)
part4$purchaser_type <- as.numeric(part4$purchaser_type)
part4$hud_median_family_income <- as.numeric(part4$hud_median_family_income)

part4$loan_amount_000s <- as.numeric(part4$loan_amount_000s)
part4$number_of_1_to_4_family_units <- as.numeric(part4$number_of_1_to_4_family_units)
part4$number_of_owner_occupied_units <- as.numeric(part4$number_of_owner_occupied_units)
part4$minority_population <- as.numeric(part4$minority_population)
part4$population <- as.numeric(part4$population)
part4$tract_to_msamd_income <- as.numeric(part4$tract_to_msamd_income)

comp_part4 <- part4[complete.cases(part4),]
rm(part4)

comp_part4$action_taken <- gsub("2", "1", comp_part4$action_taken)
comp_part4$action_taken <- gsub("8", "1", comp_part4$action_taken)
comp_part4$action_taken <- gsub("3", "0", comp_part4$action_taken)
comp_part4$action_taken <- gsub("7", "0", comp_part4$action_taken)


final_p2 <- rbind(comp_part1,comp_part2)
rm(comp_part1,comp_part2)

final_p1 <- rbind(final_p1,comp_part3)
rm(comp_part3)

final_p1 <- rbind(comp_part1,comp_part3)
rm(comp_part1,comp_part3)

final_p2 <- rbind(comp_part4, comp_part2)
rm(comp_part4, comp_part2)

write.csv(final_p1, "part2_1.csv")
write.csv(final_p2, "part2_2.csv")

batchbind <- function(x, y, w){
  library("data.table")
  x <- as.data.table(fread(x, header = T, drop = c(1)))
  y <- as.data.table(fread(y, header = T, drop = c(1)))
  a = 1; b = nrow(y)/w
  l = nrow(y)
  for (i in 1:w) {
    x <- rbind(x, y[a:b,])
    y <- y[-c(a:b),]
    a <- b + 1
    if (b < l/(w*0.5)){
      b <- l / (w*0.5)
    }
    else if (b >= l/(w*0.5) && b < (l/w)*(w-1)){
      b <- (l/w)*(w-1)
    }
    else {
      b <- l
    }
    
  }
  return(x)
}

final_p2 <- batchbind("part2_1.csv", "part2_2.csv", 4)

 
col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
              "applicant_race_1", "applicant_sex",  "application_date_indicator", "as_of_year", 
              "census_tract_number", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", 
              "hoepa_status", "lien_status", "loan_purpose", "loan_type",  "owner_occupancy","preapproval",  
              "property_type",  "purchaser_type", "respondent_id", "msamd", "state_code", "hud_median_family_income", 
              "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
              "minority_population", "population", "tract_to_msamd_income" )

bigread <- function(x, r=NULL, s=NULL){
  library("data.table")
  library("dplyr")
  
  if (is.null(r)==TRUE) {
    if (is.null(s)==TRUE){
       part4 <- as.data.table(fread(x, header = T, select = c(1,3,6,8,9,19,22:24,26,36,48,50,52,54,56,58,60,62,64,66,68,71:76,78)))
    }
    else{
       part4 <- as.data.table(fread(x, header = F, skip = s, select = c(1,3,6,8,9,19,22:24,26,36,48,50,52,54,56,58,60,62,64,66,68,71:76,78),
                                    col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                                  "applicant_race_1", "applicant_sex", "as_of_year", 
                                                  "census_tract_number", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", 
                                                  "hoepa_status", "lien_status", "loan_purpose", "loan_type",  "owner_occupancy","preapproval",  
                                                  "property_type",  "purchaser_type", "respondent_id", "msamd", "state_code", "hud_median_family_income", 
                                                  "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                                  "minority_population", "population", "tract_to_msamd_income" )))
    }
  }
  else {
    if (is.null(s)==TRUE){
      part4 <- as.data.table(fread(x, header = T, nrows = r, select = c(1,3,6,8,9,19,22:24,26,36,48,50,52,54,56,58,60,62,64,66,68,71:76,78)))
    }
    else{
      part4 <- as.data.table(fread(x, header = F, nrows = r, skip = s, select = c(1,3,6,8,9,19,22:24,26,36,48,50,52,54,56,58,60,62,64,66,68,71:76,78),
                                   col.names = c("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", 
                                                 "applicant_race_1", "applicant_sex",  "as_of_year", 
                                                 "census_tract_number", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", 
                                                 "hoepa_status", "lien_status", "loan_purpose", "loan_type",  "owner_occupancy","preapproval",  
                                                 "property_type",  "purchaser_type", "respondent_id", "msamd", "state_code", "hud_median_family_income", 
                                                 "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", 
                                                 "minority_population", "population", "tract_to_msamd_income" )))
    }
  }
  
  
  part4$applicant_ethnicity <- as.numeric(part4$applicant_ethnicity)
  part4$applicant_income_000s <- as.numeric(part4$applicant_income_000s)
  part4$applicant_race_1 <- as.numeric(part4$applicant_race_1)
  part4$applicant_sex <- as.numeric(part4$applicant_sex)
  
  part4$census_tract_number <- as.numeric(part4$census_tract_number)
  part4$co_applicant_ethnicity <- as.numeric(part4$co_applicant_ethnicity)
  part4$co_applicant_race_1 <- as.numeric(part4$co_applicant_race_1)
  part4$co_applicant_sex <- as.numeric(part4$co_applicant_sex)
  part4$hoepa_status <- as.numeric(part4$hoepa_status)
  part4$lien_status <- as.numeric(part4$lien_status)
  
  part4$loan_purpose <- as.numeric(part4$loan_purpose)
  part4$loan_type <- as.numeric(part4$loan_type)
  part4$owner_occupancy <- as.numeric(part4$owner_occupancy)
  part4$preapproval <- as.numeric(part4$preapproval)
  part4$property_type <- as.numeric(part4$property_type)
  part4$purchaser_type <- as.numeric(part4$purchaser_type)
  part4$hud_median_family_income <- as.numeric(part4$hud_median_family_income)
  part4$msamd <- as.numeric(part4$msamd)
  
  
  part4$as_of_year <- as.numeric(part4$as_of_year)
  part4$state_code <- as.numeric(part4$state_code)
  part4$loan_amount_000s <- as.numeric(part4$loan_amount_000s)
  part4$number_of_1_to_4_family_units <- as.numeric(part4$number_of_1_to_4_family_units)
  part4$number_of_owner_occupied_units <- as.numeric(part4$number_of_owner_occupied_units)
  part4$minority_population <- as.numeric(part4$minority_population)
  part4$population <- as.numeric(part4$population)
  part4$tract_to_msamd_income <- as.numeric(part4$tract_to_msamd_income)
  
  comp_part4 <- part4[complete.cases(part4),]
  rm(part4)
  

  comp_part4$action_taken <- gsub("2", "1", comp_part4$action_taken)
  comp_part4$action_taken <- gsub("3", "0", comp_part4$action_taken)

  
  comp_part4 <- comp_part4[complete.cases(comp_part4),]

  return(comp_part4)
}
records <- bigread("hmda_lar.csv", 20000000)



# assign names to the sublists
names(dt) <- c("p1_1", "p1_2", "p1_3", "p1_4")

# unlist the frames into the environment
list2env(dt ,.GlobalEnv)

# merge all the data sets
p1 <- rbind(p2_1,p2_2)
rm(p2_1,p2_2)
p2 <- rbind(p2_3,p2_4)
rm(p2_3,p2_4)
dt <- rbind(p1,p2)
rm(p1,p2)

# save objects
save(p1_2, file = "p1_2.RData")
save(p1_2, file = "p1_2.RData")
save(p1_3, file = "p1_3.RData")
save(p1_4, file = "p1_4.RData")

# remove objects
rm(p1_1,p1_2,p1_3,p1_4,dt)


# assign names to the sublists
names(dt) <- c("p2_1", "p2_2", "p2_3", "p2_4")

# unlist the frames into the environment
list2env(dt ,.GlobalEnv)

# save objects
save(p2_1, file = "p2_1.RData")
save(p2_2, file = "p2_2.RData")
save(p2_3, file = "p2_3.RData")
save(p2_4, file = "p2_4.RData")

# remove objects
rm(p2_2,p2_3,p2_4,dt,bigread,partMe,file_link)


# ensure the results are repeatable
set.seed(7)
# load the library
library(mlbench)
library(caret)

testsamp <- sample_n(records, 1000000)
testsamp <- testsamp[, -21]
testsamp$as_of_year <- as.numeric(testsamp$as_of_year)
testsamp$action_taken <- as.numeric(testsamp$action_taken)
testsamp$state_code <- as.numeric(testsamp$state_code)
# calculate correlation matrix
correlationMatrix <- cor(records[,-c(7,22)])
# summarize the correlation matrix
print(correlationMatrix)
# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)
# partition the training data

trial1 <- records[,-c(1,3,5,10,11)]
inTrain <- createDataPartition(y = trial1$decision,
                               p=0.5, list=FALSE)
training_sans_race <- trial1[inTrain,]
testing_sans_race <- trial1[-inTrain,]


set.seed(323)
modelFit1 <- train(decision ~.,data=training_sans_race, method="glm")
pred1 <- predict(modelFit1,newdata=testing_sans_race)
confusionMatrix(pred1,testing_sans_race$decision)

set.seed(654)
modelFit2 <- train(decision ~.,data=training_sans_race, method="nnet")
pred2 <- predict(modelFit2,newdata=testing_sans_race)
confusionMatrix(pred2,testing_sans_race$decision)


set.seed(21)
modelFit3 <- train(Survived ~.,data=training_titanic, method="PART")
pred3 <- predict(modelFit3,newdata=testing_titanic)
confusionMatrix(pred3,testing_titanic$Survived)