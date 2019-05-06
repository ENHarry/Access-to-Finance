# Access-to-Finance
Abstract – Access to finance is a fundamental aspect of an individual’s social and economic growth. By applying data mining techniques (exploratory and predictive analytics) to the Home Mortgage Disclosure Act data spanning a decade (from 2007 to 2016), insight is gained on the major determinants for mortgage approval or denial and how it has affected minorities over the past decade. 

 

Index Terms – Visualization, Machine Learning, Neural Network, Decision Trees, Data Mining. 

 

I.  Introduction 

“The American Dream” is a phrase that transcends time in the American society; giving the average man and woman a goal to work towards. For some it still remains the idea of having that house that you can finally call your home, with a “white picket fence”, and for others, the idea has evolved. Whatever the attainable, encapsulated in that dream, the constant themes are the need for socio-economic stability, success and freedom. Yet they can only be achieved through sufficient and unbiased Access to Finance.  

In recent times, the following questions have become prevalent in public discussion forums;  

    If things have changed in the United States, why are there still few minority owned business? 

    Why do fewer minorities the homes they live in? 

    Why is there a stagnant growth of minorities in the STEM fields and college as a whole? 

    Why are there few minority owned financial institutions (Commercial Banks, Community Banks, and Micro-Lenders). 

    Why do minorities get higher interest rates on loans? 

 

The list goes on. Yet to understand the issues with minorities in the United States, you cannot do so without talking about the issues African American have faced and continue to face in the United States. Hence, most of the references of the term “minorities” in this paper will be mostly referring to African-Americans. 

 

Due to the lack of public access to good credit loan and student loan data, and Small Business data indicating the race of the business owner, the primary data being used in this research is the Home Mortgage Disclosure Act data, downloaded from the Consumer Financial Protection Bureau (CFPB); an agency of the United States government which was established in July 2011, with the goal of putting the consumer’s needs first, they serve as a shield, protecting them from the financial industry.  

The Home Mortgage Disclosure Act (HMDA) is a federal act was approved by congress in 1975. It requires mortgage lenders to keep records of vital pieces of information regarding their lending practices (in other words, information on income, family size, the loan amount, purpose of the loan, the race of the applicant, marital status etc), which they must submit to regulatory authorities. It was implemented by the Federal Reserve through Regulation C. Both the Home Mortgage Disclosure Act and Regulation C include requirements for regulatory submissions and public disclosures. Furthermore, a publication by Investopedia also states that;  

 

“Regulation C is an important component of the Home Mortgage Disclosure Act. It was created by the Federal Reserve to detail and explain the requirements of the Act, as well as to assign specific additional conditions that all established financial institutions (Banks) must follow. In general, the primary purposes of the Home Mortgage Disclosure Act and Regulation C, are to monitor the geographic targets of mortgage lenders, provide an identification mechanism for any predatory lending practices and to provide reporting statistics on the mortgage market to the government. The Home Mortgage Disclosure Act helps to support the community investment initiatives sponsored by government programs. It does so by contributing to the oversight of the initiatives through statistical reporting. In addition, the Home Mortgage Disclosure Act also helps government officials to identify any predatory lending practices which may be affecting mortgage loan issuance. HMDA submissions also provide a means for analysing government resource allocations and ensuring that resources are appropriately allocated to fund community initiatives. Under HMDA and Regulation C certain mortgage lenders are required to maintain records of specified mortgage lending information for reporting purposes. In 2017, 6,762 lenders were required to report HMDA statistics with 16.3 million loan records reported.” [1]  

 

Features currently reported in the HMDA data includes: action taken; lien status; applicant ethnicity; applicant race; co-applicant ethnicity; co-applicant race; state; loan amount; applicant income; etc. but does not contain vital features like credit score, loan rate, payment spread, and income-to-debt-ratio, which are the type of features that can truly aid in the detection of discriminatory lending. In 2017, the new features that were approved for inclusion in the HMDA reporting includes: age of borrower; application channel; mortgage loan originator NMLS identification; credit score; combined loan-to-value (CLTV) ratio; borrower's debt-to-income (DTI) ratio; borrower-paid origination charges; points and fees; discount points; lender credits; loan term; prepayment penalties; non-amortizing loan features; interest rate; and rate spread for all loans. These new features will be seen in the 2018 HMDA data report that will be published in 2019. 

Despite the approval of the Home Mortgage Disclosure Act over four decades ago, and the Consumer Financial Protection Bureau, “Redlining” is still pervasive in the American society. A major part of this, is the data fields (such as loan interest rate, credit score, lender credits, loan term, prepayment penalties etc) being required as clear indicators of this illegal lending practice were not being disclosed. Thus, making it very difficult for external parties to identify, which in turn makes it nearly impossible to hold these institutions accountable for their actions. An article on CNN Money by Tami Luhby, which was published in 2014 stated that the average black household had amassed less than one-tenth of the wealth of a typical white one. It also predicted and warned that the financial gap was getting worse. In the article, Tami further stated that in a research which had been carried out by Brandeis University, they discovered that the financial/wealth gap between blacks and whites had nearly tripled as seen in figure 1 below. [2] 

 

Fig 1. Showing the median wealth distribution by the white and black in the US as at 2014. 

Image gotten from money.cnn.com 

 

Luhby added that the greatest factor in this wealth gap is due to the fact that home ownership among blacks is so much lower as seen in figure 2 below. With the explanation that in America, housing is often the greatest asset and a major component of overall wealth. [2] 

 

 

Fig 2. Showing the percentage distribution of home ownership by the white and black race in the US as at 2014. 

Image gotten from money.cnn.com 

 

Several publications including the NAACP 2009 report, have cited the following as prevalent consequences of the discriminatory lending practices that have impeded the accumulation of wealth in African American communities: 

    Disparities in lending were “particularly worrisome for African Americans” with respect to very high‐cost loans covered by the Home Ownership and Equity Protection Act (HOEPA). In 2005, African Americans were the only racial group to receive a substantially higher percentage of very high‐cost loans than market‐rate loans. [3, 4]  

    In 2007, African Americans paid an average of 128 basis points more for loans than did their white counterparts; and in the subprime market, the difference was 275 basis points more than their white counterparts. [3, 5] 

    Even when income and credit risk are equal, African Americans are up to 34 percent more likely to receive higher‐rate and subprime loans with a prepayment penalty than are their similarly situated white counterparts. [3, 6]  

    African Americans are 15 to 16 percent more likely to receive a higher‐rate ARM purchase loan than if they were white. [3, 7]  

    Lending discrimination placed at least one million African Americans and other people of colour at great risk of loss of wealth; an estimated loss of at least $164 billion. [3, 8]  

 

There is a hypothesis that laid the foundation for the various exploratory and predictive experiments being carried out in this research. 

 

Hypothesis  

In this research, the hypothesis is that race plays a huge role in the decision-making process of home mortgage approvals or denials, and it has not improved since the last major report on it in 2014. While a lot of financial institutions now claim to be racially blind in the decision-making process, there have been numerous publications which claim otherwise. Hence the need for this experiment. 

 

 

With the advancements in technology, particularly within the field of Machine Learning, it is possible to build automated financial lending systems that are neutral to human bias.  

The intent of this research is to see how accurately the decision of a loan application can be predicted, taking race into consideration, in order to determine if the hypothesis is true. Two tests were carried out; the first test was to check if the outcome of the application would have been different if race was not used as a predictive feature, by creating two models (one with racial features and the other without racial features) and comparing their results. The second test was to predict the race of applicants based on the application decision and other features, excluding highly correlated racial features like applicant and co-applicant ethnicity. Bearing in mind that with vital features like credit score and borrowers debt-to-income-ratio missing from the existing data, it might be difficult to detect discriminatory lending. 

 

II.  BACKGROUND 

       The term “Redlining” has been used over the years to describe a perpetual form of discrimination; where financial institutions refused to provide their services to neighbourhoods they termed as “African-American” neighbourhoods.  According to a publication by Brent Gaspaire in BlackPast.org, the origin of the term stems from the policies developed by the Home Owners Loan Corporation (HOLC) created in 1933 by the Franklin Roosevelt Administration to reduce home foreclosures during the Depression and then institutionalized by the 1937 U.S. Housing Act which established the Federal Housing Association (FHA).  Federal housing agencies including the HOLC and the FHA determined whether areas were deemed unfit for investment by banks, insurance companies, savings and loan associations, and other financial services companies. The areas were physically demarcated with red shading on a map.  In contrast, zones which were to receive preferential lending status were marked in green shading and intermediate areas in blue shading.  Often these decisions were arbitrarily based on the area’s racial composition rather than income levels. [9] 

Despite the abolishment of “redlining” in the 1968 Civil Acts law that was passed, it still continued. Neighbourhoods that local/community banks deemed unfit for investment were left underdeveloped or in disrepair.  Attempts to improve these neighbourhoods with even relatively small-scale business ventures were commonly obstructed by financial institutions that continued to label the underwriting as too risky or simply rejected them outright.  When existing businesses collapsed, new ones were not allowed to replace them, often leaving entire blocks empty and crumbling. Consequently, African Americans in those neighbourhoods were frequently limited in their access to banking, healthcare, retail merchandise, and even groceries.  One notable exception to this was (and still is) the proliferation of liquor stores and bars which seemingly transcended the area’s stigma of financial risk.  Redlining also led to an appreciable dearth of employment opportunities in these neighbourhoods as prospective small-scale employers were disinclined to locate there.  Crime often followed in the wake of these declining neighbourhoods making future investment less likely.  These developments created a cycle which seemingly justified the initial redlining practices. [9]    

The ripple effects are very much evident in modern day America.  

III.  METHODOLOGY 

A.Data Collection and Preprocessing 

The 2007 to 2016 data which is about 100 gigabytes was downloaded in two parts from the Consumer Financial Protection Bureau.  Through the CFPB API, the public has the option of downloading the data with or without the data codes, but not without the actual value names. As such, the data came with labels as well. Hence, because of the size of the data, only the first five thousand rows were read in initially. This process made it easier to determine with columns contained character labels and which contained the label codes.  

 

Using the column index, only the desired variables ("action_taken", "agency_code", "applicant_ethnicity", "applicant_income_000s", "applicant_race_1", "applicant_sex", "as_of_year", "co_applicant_ethnicity", "co_applicant_race_1", "co_applicant_sex", "hoepa_status", "lien_status", "loan_purpose", "msamd", "preapproval", "purchaser_type", "respondent_id, "state_code", "hud_median_family_income", "loan_amount_000s", "number_of_1_to_4_family_units",  "number_of_owner_occupied_units", "minority_population", "population", "tract_to_msamd_income" 

)  

were finally read into R for preprocessing.   

 

Since all the variables were imported as character class instead of numeric class, all the variables/features except for the “respondent_id” were converted to numeric class.  Doing this resulted in the replacement of the blank row entries to be replaced with the missing “NA” values. Consequently, the next step in the preprocessing phase was the removal of all rows that contained at least one “NA” value. Next in the “action_taken”, out of the existing eight possible entries: 

  

1 -- Loan originated  

2 -- Application approved but not accepted  

3 -- Application denied by financial institution  

4 -- Application withdrawn by applicant  

5 -- File closed for incompleteness  

6 -- Loan purchased by the institution  

7 -- Preapproval request denied by financial institution  

8 -- Preapproval request approved but not accepted 

 

The only actions relevant to this study are: 1-- Loan originated, which is a way of saying that the loan was approved by the institution and accepted by the applicant; 2 -- Application approved but not accepted; 3 -- Application denied by financial institution. 

 

The application approved but not accepted, represented by code 2, is replaced to code 1, thus ensuring that all loan approvals have the same identifier. While the application denied by financial institution, represented by code 3 is replaced with code 0. This ensures that all models will require “Binary Classification”. Lastly, a new subset of the data is collected, with the condition that all rows are selected where the “action_taken” variable has a value of either 0 or 1.  

 

The processed data was then exported as a comma-separated values (csv) file for the exploratory visualization in Tableau. 

B.The Story Within the Data 

       Having exported the data as a csv file, it is then imported into Tableau. And as in any good visualization, the visuals must provide answers to clearly defined questions. Since the recession occurred in 2009, the primary focus of the exploratory analysis will be on the data from 2012 to 2016. 

  

Question 1: What is the overall ratio of loan approvals to denials from 2012 to 2016? 

 

 

 

Fig 3. Showing the total number of home mortgage approvals and denials from 2012 to 2016. 

 

From figure 3 above, it is clear that the ratio of approvals to denials is approximately a 5 to 1 ratio. 

 

Question 2: Has there been a consistent increase in the loan approvals from 2012 to 2016? 

 

 

 

Fig 4. Showing the trend of home mortgage approvals and denials from 2012 to 2016. 

 

Looking at the trend lines of both the number of denials and approvals by year in figure 4 above, it is surprising to see that even three to five years after the 2009 recession, there was still a constant decline in the numbers, with it taking a huge dip in 2014. But by 2015 the numbers begin to increase. As at 2016 it is still not as high as it was in 2012. This means that overall, the number of individuals that sought mortgages continued to even three to five years after the 2009 recession and is now slowly beginning to increase.  Given the premise of historical lending discrimination, the next question that rises is how this has affected it. 

Question 3: What is the trend in approvals and denials by race from 2012 to 2016? 

 

 

 

Fig 5. Showing the trend of home mortgage approvals and denials from 2012 to 2016. 

 

 

 

 

Fig 6. Showing the trend of home mortgage approvals and denials from 2012 to 2016. 

 

Looking at the plots in figure 5 and figure 6, it is clear that in general there are always more white applicants than black applicants. From the data, approximately 85% of all white applicants get approved for a home loan, which is better than all black applicants from which only approximately 68% of the applicants get approved.  

 

In 2016 particularly, a total of 2,797,327 white applicants are accounted for in data set that is missing some applicants due to the NA coercion and removal. Out of that number, only 426,741 applications were denied, which is still an 85% approval rate. Whereas, out of 156,185 black applicants, 51,231 applications were denied, making it a 67% approval rate in 2016. This implies that while the ‘white approval rate” did not deviate from the overall average in 2016, the “black approval rate” declined by 1% from its average in that same year. 

 

 

C.Building the Prediction Models 

 

       Before proceeding to train models, the data was first normalized. After that, to ensure that the models will not be biased to a certain training class, and also because of the large size of the data, the following process was used in the sampling of the data: 

 

Firstly, a correlation test is done to know exactly which variables are highly correlated to one another by creating a correlation matrix, and then selecting the ones that were highly correlated, with the cutoff set as 0.5.  

 

    Test 1 – with Action Take as Class 

 

The data set is divided into two parts, based on the action taken variable. The first being a subset of all the approved applications, and the second a subset of all the denied applications. These two subsets are broken down further by race and year. For the subset of approved applications, fourteen thousand records are randomly selected for each combination of application decision, year, and race. In like manner, for the subset of denied applications, fourteen thousand records are selected on the combination of application decision, year, and race. All the randomly selected subsets are then merged into one data frame. The goal was to have a balanced class in the data set on which all models would be trained and tested.   

 

Thereafter, the data is partitioned into two equal parts by random selection since it is still too big for R train on. Hence the test to select features by prediction relevance will be done with the first partition, while the actual training and test data will be derived from the second partition. Before proceeding, a decision on the two models best suited had to be made. Since the task at hand is a binary classification task, the caret models selected were: C5.0 and NNET. The method of train control to avoid overfitting of all the models is cross validation, set to repeat three times. The second subset for the training and testing data is partitioned eighty percent to twenty percent respectively. The action taken class in the data is symbolized by 0 and 1 where 0 represents application denied, and 1 represents application approved. 

 

C5.0 – This decision tree generating algorithm was chosen because much like the what is expected in the loan application process, the algorithm is capable to creating efficient trees using only the relevant features. The “C5.0” algorithm in the caret package is used to train the C5.0 model on the first partition, after which the features being used in the model based on their importance. In both models, ‘1 – application approved” is used as the negative class while “0 – application denied is used as the positive class. The ranking of the features from the most important to the least important, for the model with racial features and the model without racial features can be seen in figures 7 and 8 respectively. 

 

 

 

Fig 7. Showing a plot of the features in the order of their importance to the C5.0 model with racial features present. 

From figure 7 above, it is not surprising that the top features are loan amount, purchaser type, applicant income lien status and household median income C5.0 model. Though having a specific agency (in this case the agency represented by number 9, which is CFPB), be a top predictor, is noteworthy because it may imply that approval and denial rates are also dependent on the agency handling the application. It is also quite interesting that the ethnicity and race of the co-applicant are considered to be more important than the race and ethnicity of the applicant in this model. 

 

 

Fig 8. Showing a plot of the features in the order of their importance to the C5.0 model without racial features present. 

In figure 9 above, it can be observed that in the C5.0 model at has all racial features removed, the ranking of the features by importance has a complete shift, with; agency 9, household median income, and lien status, which were previously highly ranked, now no longer of utmost importance.   

 

NNET – This neural network algorithm was chosen because it works well on both classification and regression problems. It also works very differently from the decision tree, giving the much-needed diversity this study. The same data that has been used with the C5.0 algorithm to determine the important features and model training, was used with this neural network model. The ranking of the features from the most important to the least important, for the model with racial features and the model without racial features can be seen in figures 10 and 11 respectively. 

 

 

Fig 10. Showing a plot of the features in the order of their importance to the NNET -Neural Network model with racial features present. 

Unlike the C5.0 model with racial features, this NNET model with features does not consider the applicant’s income to be a feature of utmost importance. Surprisingly, it considers how close the applicants household median income is to the median income in his or her metropolitan region to be of utmost importance, while the applicant’s ethnicity and co-applicant’s ethnicity are ranked higher than their race.  

 

 

Fig 11. Showing a plot of the features in the order of their importance to the NNET -Neural Network model without racial features present. 

In figure 11, it can be observed that unlike the previous neural network that had racial features, this model considers the gender of the co-applicant to be the most important feature, followed by the median household income of the applicant’s metropolitan area. 

 

    Test 2 – with Race as Class 

Similar to the previous process, the data set is divided into two parts, based on the “applicant_race_1” variable. The first being a subset of all the approved applications, and the second a subset of all the denied applications. These two subsets are broken down further by sex (gender) and year. For the subset of approved applications, fourteen thousand records are randomly selected for each combination of year and sex (gender). In like manner, for the subset of denied applications, twelve thousand records are selected on the combination of year and sex (gender). All the randomly selected subsets are then merged into one data frame. The goal was to ensure the race class is balanced in the data set to build the models and test them on.   

Thereafter, the data is partitioned into two equal parts by random selection since the data was still too big for R train on. Once more, the test to select features by prediction relevance was done with the first partition for the C5.0 and NNET algorithms, while the actual training and test data are derived from the second partition. The algorithms being used, train control and ratio of train data to test data all remains the same.  

 

Figure 12 below shows the ranking of the features from the most important to the least important in the C5.0 model. 

 

 

Fig 12. Showing a plot of the features in the order of their importance to the C5.0 model with race as the class. 

Unlike the previous C5.0 which was trained with racial features present, this C5.0 model considers the state, minority population and “msamd - Metropolitan Statistical Area/Metropolitan Division” to be of equal and utmost importance as “purchaser_type”. 

 

Figure 13 is an image of a part of the decision tree for the prediction of race. The full summary of this decision tree can be found in section 7 of the appendix. 

 

Fig 13.  A partial plot the C5.0 decision tree with race as the class 

Figure 14 below shows the ranking of the features from the most important to the least important in the NNET model. 

 

 

Fig 14. Showing a plot of the features in the order of their importance to the neural network model with race as the class. 

Similar to the neural network model which had racial features with the application decision as the class, this model prioritized how close the applicant’s household median income is to the median income in his or her metropolitan region to be of utmost importance.  

 

 

IV.  Results 

Results of Predictions with “Decision” as Class 

The feature importance ranking by the different models shows that the even if the models utilize the same data set and similar algorithms as in the case of the two C5.0 models that predict on the “action_taken” variable and the two NNET models that also predict on the same variable.  

 

The confusion matrices and statistical measures of the C5.0 model that had racial features, with the “action_taken” as the class are as follows: 

 

Accuracy : 0.8776 

Sensitivity : 0.9731 

Specificity : 0.7821 

Pos Pred Value : 0.8171 

Neg Pred Value : 0.9668 

Prevalence : 0.5000 

Detection Rate : 0.4866 

Detection Prevalence : 0.5955 

Table 1. Statistical measures of prediction results from C5.0 model with racial features present. 

 

In table 1 above, the accuracy of the racially biased C5.0 model in predicting the action taken is approximately 88% which is relatively high. It shows that the model is pretty good at predicting the present outcome of mortgage applications based on the existing data. The sensitivity or recall of the model, which by definition, is the rate at which the model accurately detects which applicant will be denied is approximately 97% which will be very good if the existing lending system was not purported to be biased. While the specificity, which is the rate at which the model accurately identifies applicants that will be approved is approximately 78%. Furthermore, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.82 and 0.97 respectively. This indicates a need for a more granular assessment of the model’s prediction results. 

 

Confusion Matrix of C5.0 Decision with Racial Features 

  
	

Denied 
	

Approved   
	

Total Predictions 

Denied 
	

6812 
	

1525  
	

8337 

 Approved 
	

188 
	

5475 
	

5663 

Total Actuals 
	

7000 
	

7000 
	

  

Table 2. Confusion matrix of prediction results from C5.0 model with racial features present. 

The high-level confusion matrix in table 2 above, where “Denied” is the default positive class in the model, it shows that despite having a balanced prediction class, the model misclassified approximately 21% and 3% of the approved and denied applications respectively. 

 

Confusion Matrix of C5.0 Decision with Racial for Black Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1525 
	

344 
	

1869 

Approved 
	

27 
	

1109 
	

1136 

Total Actuals 
	

1552 
	

1453 
	

  

Table 3. Confusion matrix of prediction results from C5.0 model with racial features present for black applicants. 

Confusion Matrix of C5.0 Decision with Racial for White Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1412 
	

343 
	

1755 

Approved 
	

42 
	

1192 
	

1234 

Total Actuals 
	

1454 
	

1535 
	

  

Table 4. Confusion matrix of prediction results from C5.0 model with racial features present for white applicants 

 

In table 3, the rate of misclassifying the application decision for black applicants with respect to approvals as denials is approximately 24%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 2%. On the other hand, in table 4, the rate of misclassifying the application decision for white applicants with respect to approvals as denials is approximately 22%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 3%.  

 

For comparison, the confusion matrices and statistical measures of the C5.0 model that had racial features removed, with the “action_taken” as the class are as follows: 

 

Accuracy : 0.8664 

Sensitivity : 0.9523 

Specificity : 0.7806 

Pos Pred Value : 0.8127 

Neg Pred Value : 0.9424 

Prevalence : 0.5000 

Detection Rate : 0.4761 

Detection Prevalence : 0.5859 

Table 5. Statistical measures of prediction results from C5.0 model without racial features present. 

 

In table 5 above, the accuracy of the racially blind model in predicting the action taken is approximately 87% which is just one-point shy of its predecessor. And just like the its predecessor, the model is pretty good at predicting the present outcome of mortgage applications based on the existing data. With a sensitivity or recall of approximately 95%, and a specificity 78%, while there was no change in the specificity, the two-point deduction in the sensitivity could be indicating a tilt towards less racially biased decision. Furthermore, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.81 and 0.94 respectively, showing 0.01 and 0.03 points reduction. A closer look at the model’s performance.   

 

Confusion Matrix of C5.0 Decision without Racial Features 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

6666 
	

1536 
	

8202 

Approved 
	

334 
	

5464 
	

5798 

Total Actuals 
	

7000 
	

7000 
	

  

Table 6. Confusion matrix of prediction results from C5.0 model without racial features present. 

The high-level confusion matrix of the C5.0 model without racial features in table 6 above, where “Denied” is the default positive class in the model, once more shows that despite having a balanced prediction class, the model misclassified approximately 22% and 5% of the approved and denied applications respectively. 

 

Confusion Matrix of C5.0 Decision without Racial Features for Black Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1486 
	

341 
	

1827 

Approved 
	

66 
	

1112 
	

1178 

Total Actuals 
	

1552 
	

1453 
	

  

Table 7. Confusion matrix of prediction results from C5.0 model without racial features present for black applicants. 

 

 

 

Confusion Matrix of C5.0 Decision for without Racial Features White Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1372 
	

326 
	

1698 

Approved 
	

82 
	

1209 
	

1291 

Total Actuals 
	

1454 
	

1535 
	

  

Table 8. Confusion matrix of prediction results from C5.0 model without racial features present for white applicants. 

In table 7, the rate of misclassifying the application decision for black applicants with respect to approvals as denials is approximately 24%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 4%. On the other hand, in table 8, the rate of misclassifying the application decision for white applicants with respect to approvals as denials is approximately 21%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 6%. 

 

In comparing the approval rate of black and white applicants in both C5.0 models, it can be observed that in the first model, their approval rates are approximately 76% and 78% respectively, while in the second model, their approval rates are approximately 77% and 79% respectively. 

 

The statistical measures and confusion matrices of the NNET model that had racial features, with the “action_taken” as the class are as follows: 

 

Accuracy : 0.8702 

Sensitivity : 0.9897 

Specificity : 0.7507 

Pos Pred Value : 0.7988 

Neg Pred Value : 0.9865 

Prevalence : 0.5000 

Detection Rate : 0.4949 

Detection Prevalence : 0.6195 

Table 9. Statistical measures of prediction results from NNET model with racial features present. 

 

In table 9 above, the accuracy of the racially biased NNET model in predicting the action taken is approximately 87% which is one-point lower than the racially biased C5.0 model. Similarly, this means that the model is ok at predicting the present outcome of mortgage applications based on the existing data. Yet, the sensitivity or recall of this neural network model, is approximately 99%. This implies that unlike the C5.0 models, it is nearly perfect at detecting applicants who will be denied which will be extremely good in a fair lending system. On the other hand, the specificity, which is the rate at which the model accurately identifies applicants that will be approved is approximately 75%. Furthermore, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.80 and 0.99 respectively.  

 

 

 

Confusion Matrix of NNET Decision with Racial Features 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

6928 
	

1745 
	

8673 

Approved 
	

72 
	

5255 
	

5327 

Total Actuals 
	

7000 
	

7000 
	

  

Table 10. Confusion matrix of prediction results from NNET model with racial features present. 

The high-level confusion matrix in table 10 above, where “Denied” is the default positive class in the model, shows that despite having a balanced prediction class, the model misclassified approximately 25% and 1% of the approved and denied applications respectively. 

 

Confusion Matrix of NNET Decision with Racial Features for Black Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1543 
	

380 
	

1923 

Approved 
	

9 
	

1073 
	

1082 

Total Actuals 
	

1552 
	

1453 
	

  

Table 11. Confusion matrix of prediction results from NNET model with racial features present for black applicants. 

Confusion Matrix of NNET Decision for with Racial Features White Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1432 
	

367 
	

1799 

Approved 
	

22 
	

1168 
	

1190 

Total Actuals 
	

1454 
	

1535 
	

  

Table 12. Confusion matrix of prediction results from NNET model with racial features present for white applicants. 

In table 11, the rate of misclassifying the application decision for black applicants with respect to approvals as denials is approximately 26%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 1%. On the other hand, in table 12, the rate of misclassifying the application decision for white applicants with respect to approvals as denials is approximately 24%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 2%.  

 

For comparison, the confusion matrices and statistical measures of the NNET model that had racial features removed, with the “action_taken” as the class are as follows: 

 

Accuracy : 0.8674 

Sensitivity : 0.9960 

Specificity : 0.7389 

Pos Pred Value : 0.7923 

Neg Pred Value : 0.9946 

Prevalence : 0.5000 

Detection Rate : 0.4980 

Detection Prevalence : 0.6286 

Table 13. Statistical measures of prediction results from NNET model without racial features present. 

 

In table 13 above, the accuracy of the racially blind model in predicting the action taken is approximately 87% which is the same as the racially biased NNET model and the racially blind C5.0 model. And just like the its predecessors, the model is pretty good at predicting the present outcome of mortgage applications based on the existing data. With a sensitivity or recall of approximately 100%, it is perfect at detecting applicants who will be denied which. But it has a specificity of approximately 74%, making it average for determining which applicants will be approved for a home loan, within the current lending system. In addition, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.79 and 1.0 respectively, showing 0.01 points reduction, and 0.01 points increase respectively. This is noticeably different from the racially blind C5.0 model, which showed an all-round reduction in the positive and negative prediction values, from that of the racially biased C5.0 model.   

 

Confusion Matrix of NNET Decision without Racial Features 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

6972 
	

1828 
	

8800 

Approved 
	

28 
	

5172 
	

5200 

Total Actuals 
	

7000 
	

7000 
	

  

Table 14. Confusion matrix of prediction results from NNET model without racial features present. 

The high-level confusion matrix in table 14 above, where “Denied” is the default positive class in the model, once more, despite having a balanced prediction class, the model misclassified approximately 26% and 0.004% of the approved and denied applications respectively. This model has a significant decline in the “false negative” rate. 

 

Confusion Matrix of NNET Decision without Racial Features for Black Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1550 
	

394 
	

1944 

Approved 
	

2 
	

1059 
	

1061 

Total Actuals 
	

1552 
	

1453 
	

  

Table 15. Confusion matrix of prediction results from NNET model without racial features present for black applicants 

 

Confusion Matrix of NNET Decision for without Racial Features White Applicants 

  
	

Denied 
	

Approved 
	

Total Predictions 

Denied 
	

1447 
	

407 
	

1854 

Approved 
	

7 
	

1128 
	

1135 

Total Actuals 
	

1454 
	

1535 
	

  

Table 16. Confusion matrix of prediction results from NNET model without racial features present for white applicants. 

In table 15, the rate of misclassifying the application decision for black applicants with respect to approvals as denials is approximately 27%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 0.001%. On the other hand, in table 16, the rate of misclassifying the application decision for white applicants with respect to approvals as denials is approximately 27%, while the rate of misclassifying their application decision with respect to denials as approvals is approximately 0.01%.  

 

In comparing the approval rate of black and white applicants in both NNET models, it can be observed that in the first model, their approval rates are approximately 74% and 76% respectively, while in the second model, their approval rates are approximately 73% and 75% respectively.  

 

Results of Predictions with “Race” as Class 

During the feature selection process for both models, their diversity can be seen in the disparities of the features they consider to be of utmost importance, necessary to predict the race of the applicants. 

 

The confusion matrices and statistical measures of the C5.0 model, with the “applicant-race-1” as the class are as follows: 

 

Accuracy : 0.767 

Sensitivity : 0.7514 

Specificity : 0.7826 

Pos Pred Value : 0.7756 

Neg Pred Value : 0.7589 

Prevalence : 0.5000 

Detection Rate : 0.3757 

Detection Prevalence : 0.4844 

Table 17. Statistical measures of prediction results from C5.0 model with race as the class. 

 

In table 17 above, the accuracy of the C5.0 model in predicting the race of the applicant based on the action taken and other recorded features is approximately 77%, with a sensitivity or recall of approximately 75%, and a specificity 78%. In addition, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.78 and 0.76 respectively.   

 

Confusion Matrix of C5.0 Race Predictions 

  
	

Black  
	

White 
	

Total Predictions 

Black 
	

10519 
	

3044 
	

13563 

White  
	

3481 
	

10956 
	

14437 

Total Actuals 
	

14000 
	

14000 
	

  

Table 18. Confusion matrix of prediction results from C5.0 model with race as the class. 

 

As shown in table 18 above, it was observed that the C5.0 model misclassified approximately 25% of the black applicants as white, and approximately 22% of the white applicants as black. The confusion matrix was further synthesized by the decision taken to attain clarity on the extent of the misclassifications. 

 

Confusion Matrix of C5.0 Race Predictions by Approvals  

  
	

Black 
	

White 
	

Total Predictions 

Black 
	

6401 
	

2057 
	

8458 

White 
	

2955 
	

9453 
	

12408 

Total Actuals 
	

9356 
	

11510 
	

  

Table 19. Confusion matrix of prediction results from C5.0 model with race as the class by approvals. 

 

Confusion Matrix of C5.0 Race Predictions by Denials 

  
	

Black 
	

White 
	

Total Predictions 

Black 
	

4118 
	

987 
	

5105 

White 
	

526 
	

1503 
	

2029 

Total Actuals 
	

4644 
	

2490 
	

  

Table 20. Confusion matrix of prediction results from C5.0 model with race as the class by denials. 

 

In table 19 above, approximately 32% of the black applicants who were approved for a home loan were misclassified as white, while only 18% of the white applicants who were approved for a home loan were misclassified as black. In the case of the denials, approximately 11% of the black applicants who were denied a home loan were misclassified as white, while approximately 40% of the white applicants who were denied a home loan were misclassified as black. 

 

The confusion matrices and statistical measures of the NNET model, with the “applicant-race-1” as the class are as follows: 

 

Accuracy : 0.7204 

Sensitivity : 0.6896 

Specificity : 0.7511 

Pos Pred Value : 0.7348 

Neg Pred Value : 0.7076 

Prevalence : 0.5000 

Detection Rate : 0.3448 

Detection Prevalence : 0.4692 

Table 21. Statistical measures of prediction results from NNET model with race as the class. 

 

In table 21 above, the accuracy of the NNET model in predicting the race of the applicant based on the action taken and other recorded features is approximately 72%, with a sensitivity or recall of approximately 69%, and a specificity 75%. In addition, the model’s approximate rate for positive prediction (pos pre value) and negative prediction (neg pre value) are 0.74 and 0.71 respectively.  All the metrics in this neural network model are significantly lower than those in the C5.0 decision tree model. 

 

Confusion Matrix of NNET Race Predictions 

  
	

Black 
	

White 
	

Total Predictions 

Black 
	

9655 
	

3484 
	

13139 

White 
	

4345 
	

10516 
	

14861 

Total Actuals 
	

14000 
	

14000 
	

  

Table 22. Confusion matrix of prediction results from NNET model with race as the class. 

As shown in table 22, it was observed that the NNET model misclassified approximately 31% of the black applicants as white, and approximately 25% of the white applicants as black. The confusion matrix was further synthesized by the decision taken to attain clarity on the extent of the misclassifications. 

 

Confusion Matrix of NNET Race Predictions by Approvals 

  
	

Black 
	

White 
	

Total Predictions 

Black 
	

5565 
	

2244 
	

7809 

White 
	

3791 
	

9266 
	

13057 

Total Actuals 
	

9356 
	

11510 
	

  

Table 23. Confusion matrix of prediction results from NNET model with race as the class by approvals. 

 

Confusion Matrix of NNET Race Predictions by Denials 

  
	

Black 
	

White 
	

Total Predictions 

Black 
	

4090 
	

1240 
	

5330 

White 
	

554 
	

1250 
	

1804 

Total Actuals 
	

4644 
	

2490 
	

  

 

Table 24. Confusion matrix of prediction results from NNET model with race as the class by denials. 

 

In table 23 above, approximately 41% of the black applicants who were approved for a home loan were misclassified as white, while only 24% of the white applicants who were approved for a home loan were misclassified as black. In the case of the denials, approximately 12% of the black applicants who were denied a home loan were misclassified as white, while approximately 50% of the white applicants who were denied a home loan were misclassified as black. 

 

NOTE 

All the confusion matrices were derived from a comparison of the individual frequencies of approvals and denials from the actual sampled data and the predictions. The full frequency tables of the actuals and predictions for all the races represented in the data can be found in the section 1 to 6 of the appendix. 

 

V.  related work 

Similar work includes and is not limited to the research done by Brandeis University, “Kept out: How banks block people of color from home ownership” article by Aaron Glantz and Emmanuel Martinez, and the NAACP report on discriminatory lending. 

 

VI.  conclusion 

             Even though the misclassification rate of approvals for denials did not decrease when the racial features were removed from the models that predicted the application decision, the two-point increase in the misclassification rate of denials for approvals, is a slight inclination that discriminatory lending may still exist. Nevertheless, it is important to note that training the models to predict the decision does not clearly show discriminatory lending practices, since the models were trying to be as accurate as possible, whereas high accuracy in this research is not a good indicator given that important features like credit score, and debt-to-income-ratio of the applicants were not provided. On the other hand, the fluctuations seen in the specificity of the four models can also be taken as a slight indicator of discriminatory lending, but it is still not definitive. 

 

While it is difficult to clearly say that the results from the first sets of tests are indicative of discriminatory lending, the second set of tests that trained the C5.0 decision tree and NNET neural network models to predict the race of the applicant based on the application decision and other variables are more definitive. Given that in both models, the rate of misclassification of black applicants as white applicants, who had their loans approved, was approximately twice the rate of misclassification of white applicants as black applicants, who had their loans approved. 

In addition, in both models, the rate of misclassification of white applicants as black applicants, who had their loans denied, was approximately four times the rate of misclassification of black applicants as white applicants, who had their loans denied.   

 

Based on these results, it is highly conclusive that the hypothesis “that race plays a huge role in the decision-making process of home mortgage approvals or denials, and it has not improved since the last major report on it in 2014” is true;  

 

Improvements 

Within the next five years, another research can be carried out using the new HMDA data, since it would have been updated to have important features like the applicant’s credit score, loan interest rate and spread, debt-to-income-ratio, and prepayment penalties. Predictions can then be run to see if your race determines things like the loan interest rate and spread. 

 

References 

    Staff, I. (2018, March 16). Home Mortgage Disclosure Act (HMDA). Retrieved from https://www.investopedia.com/terms/h/home-mortgage-disclosure-act-hmda.asp 

    Luhby, T. (2014, August 21). 5 disturbing stats on black-white inequality Retrieved from http://money.cnn.com/2014/08/21/news/economy/black-white-inequality/index.html 

    Morris, M. W. (2009). Discrimination and Mortgage Lending in America (pp. 2-3, Publication). Baltimore, MD: NAACP.  

    National Community Reinvestment Coalition, The 2005 Fair Lending Disparities: Stubborn and Persistent II (Washington, DC: National Community Reinvestment Coalition, 2006), http://www.ncrc.org/images/stories/pdf/research/ncrc%202005%20hmda%20report.pdf  

    Federal Home Loan Mortgage Corporation, Annual Report (McLean, VA: Federal Home Loan Mortgage Corporation, 2007). 

    U.S. Department of Housing and Urban Development, Unequal Burden. 

    Ibid. 

    Center for Responsible Lending, http://www.responsiblelending.org, 2009. See also A. Rivera, B. Cotto‐Escalara, A. Desai, J. Huezo, and D. Muhammad, Foreclosed: State of the Dream (Boston, MA: United for a Fair Economy, 2008). 

    Gaspaire, Brent. “Redlining (1937- ).” BlackPast.org Remembered and Reclaimed, www.blackpast.org/aah/redlining-1937. 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 
