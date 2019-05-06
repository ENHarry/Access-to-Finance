# ensure it is reproducible
set.seed(001)
 
# load useful packages
library(mlbench)
library(caret)

# ensure data is numeric
df <- as.data.table(apply(df12_16[,-17], 2, as.numeric))

# normalize data
df[,c(4,14,18:20,22:24)] <- scale(df[, c(4,14,18:20,22:24)])
df$respondent_id <- df12_16$respondent_id

# feature elimination by correlation
correlationMatrix <- cor(df[,-25])

# summarize the correlation matrix
print(correlationMatrix)

# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)

# print indexes of highly correlated attributes
print(highlyCorrelated)
 [1]  4 14 18 19 20 22 23  1  3  6  5

# Based on the above test, applicant income, msamd,hud_median_family_income, loan_amount, family units, minority population and population are highhly 
# correlated to eachother, while action taken, applicant ethnicity, applicant race, applicant sex, are highly correlated.

# next, check the prediction strength of each feature.
rm(df12_16)
df$action_taken <- as.character(df$action_taken)

save(df, file =  df12-16_sample.RData )

# partition data set into 2 equal parts

inTrain <- createDataPartition(y = df$action_taken,
                               p=0.5, list=FALSE)
p1_12_16 <- df[inTrain,]

p2_12_16 <- df[-inTrain,]


# feature selection by prediction strength 

# prepare training scheme
control <- trainControl(method= repeatedcv , number=2, repeats=3)       
      
# train the model
model1 <- train(action_taken ~ co_applicant_race_1 + co_applicant_sex + hoepa_status + lien_status + loan_purpose + msamd + preapproval + 
			purchaser_type +tract_to_msamd_income + agency_code applicant_ethnicity + applicant_income_000s + applicant_race_1 + 
			applicant_sex + as_of_year + co_applicant_ethnicity + population + state_code + hud_median_family_income + loan_amount_000s + 
			number_of_1_to_4_family_units  + number_of_owner_occupied_units +  minority_population , 
                  data= p1_12_16, method="rf" , trControl=control)

# estimate variable imrportance
importance1 <- varImp(model, scale=FALSE)
# summarize importance
print(importance1)
# plot importance
plot(importance1)

model2 <- train(action_taken ~ co_applicant_race_1 + co_applicant_sex + hoepa_status + lien_status + loan_purpose + msamd + preapproval + 
			purchaser_type +tract_to_msamd_income + agency_code + applicant_ethnicity + applicant_income_000s + applicant_race_1 + 
			applicant_sex + as_of_year + co_applicant_ethnicity + population + state_code + hud_median_family_income + loan_amount_000s + 
			number_of_1_to_4_family_units  + number_of_owner_occupied_units +  minority_population , 
                  data= p1_12_16, method= "C5.0" , trControl=control)

# estimate variable imrportance
importance2 <- varImp(model2, scale=FALSE)
# summarize importance
print(importance2)
# plot importance
plot(importance2)

model3 <- train(action_taken ~ co_applicant_race_1 + co_applicant_sex + hoepa_status + lien_status + loan_purpose + msamd + preapproval + 
			purchaser_type +tract_to_msamd_income + agency_code + applicant_ethnicity + applicant_income_000s + applicant_race_1 + 
			applicant_sex + as_of_year + co_applicant_ethnicity + population + state_code + hud_median_family_income + loan_amount_000s + 
			number_of_1_to_4_family_units  + number_of_owner_occupied_units +  minority_population , 
                  data= p1_12_16, method= "rpart" , trControl=control)

# estimate variable imrportance
importance3 <- varImp(model3, scale=FALSE)
# summarize importance
print(importance3)
# plot importance
plot(importance3)


model4 <- train(action_taken ~ co_applicant_race_1 + co_applicant_sex + hoepa_status + lien_status + loan_purpose + msamd + preapproval + 
			purchaser_type +tract_to_msamd_income + agency_code + applicant_ethnicity + applicant_income_000s + applicant_race_1 + 
			applicant_sex + as_of_year + co_applicant_ethnicity + population + state_code + hud_median_family_income + loan_amount_000s + 
			number_of_1_to_4_family_units  + number_of_owner_occupied_units +  minority_population , 
                  data= p1_12_16, method= "glm" , trControl=control)

# estimate variable imrportance
importance4 <- varImp(model4, scale=FALSE)
# summarize importance
print(importance4)
# plot importance
plot(importance4)


model5 <- train(action_taken ~ co_applicant_race_1 + co_applicant_sex + hoepa_status + lien_status + loan_purpose + msamd + preapproval + 
			purchaser_type +tract_to_msamd_income + agency_code + applicant_ethnicity + applicant_income_000s + applicant_race_1 + 
			applicant_sex + as_of_year + co_applicant_ethnicity + population + state_code + hud_median_family_income + loan_amount_000s + 
			number_of_1_to_4_family_units  + number_of_owner_occupied_units +  minority_population , 
                  data= p1_12_16, method= "nnet" , trControl=control)

# estimate variable imrportance
importance5 <- varImp(model5, scale=FALSE)
# summarize importance
print(importance5)
# plot importance
plot(importance5)

# create 2 equal partitions of the 2012 - 2016 data






# partition data set into training and testing
