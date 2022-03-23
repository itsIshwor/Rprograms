# ----------------------------------
# Assignment#2 
# MSDA3050 Spring 2022
# ----------------------------------
# 40 points total [10 % of your final grade]
# Due: Wednesday, March 23, 2022 by 6:30 pm
# [no submission will be accepted after the due date]
## --------------------------------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------------------------------

# install the required  packages:
install.packages("tidyverse")
install.packages("broom")
install.packages("datarium")
install.packages("ggfortify")

# Packages needed for this Homework
library(tidyverse)
library(broom) 
library(ggfortify)
library(haven)


# read the dataset:
# read the dataset:
helpdat <- haven::read_spss("helpmkh.sav")
# create subset, select indtot, cesd and racegrp
h1_data <- helpdat %>%select(indtot, cesd, racegrp)

#check data in h1_data
h1_data

# ( A ) Perform a Simple Linear Regression for: (10 Points)
# 1- OUTCOME (y_hat) variable cesd: ???Center for Epidemiological Studies-Depression (CESD) total score - Baseline???
# 2- PREDICTOR variable (x) indtot: ???Inventory of Drug Use Consequences (InDue) total score - Baseline???

#------------------------------------------------------------------------------------------------------
# Write your code here for running/fit/train a simple linear regression using lm() function ( 5 Points)
#------------------------------------------------------------------------------------------------------
fit <- lm(cesd~indtot h1_data)

#------------------------------------------------------------------------------------------------------
# Write your code here for a summary() of the model ( 5 Points)
#------------------------------------------------------------------------------------------------------

summary(fit)

#------------------------------------------------------------------------------------------------------
# ( B ) Fitted values and residuals using augment function from broom package and disply the head  (5 Point)
#------------------------------------------------------------------------------------------------------
# Write your code here:
#----------------------
library(broom)
?tidy  #take help
tidy(fit)
model_diag <- augment(fit)
head(model_diag) 

#------------------------------------------------------------------------------------------------------
# ( C ) Perform regression diagnostics: (25 points)
# 1- check the normality of the residuals (histogram and Q-Q plots)
# 2- check for linearity - is there any systematic relationship between the residuals and the predicted (or fitted) values?
# 3- homoscedasticity - plot of standardized residuals versus fitted values - this is known as a ???Scale-Location??? graph.

#------------------------------------------------------------------------------------------------------
# Write your code here for diagnostic plots using par() and plot() ( 5 Points)
#------------------------------------------------------------------------------------------------------
par(mfrow = c(2,2)) # create two graph in each row
plot(fit)

#------------------------------------------------------------------------------------------------------
# Write your code here for diagnostic plots using ggplot() package (5 Points)
#------------------------------------------------------------------------------------------------------
?autoplot
#autoplot(fit, label.size = 3) #ggplot's function that gives all the graph at once
ggplot(model_diag,aes(indtot,cesd))+ 
  geom_point()+
  stat_smooth(method = lm, se = FALSE)+
  geom_segment(aes(xend = indtot, yend = .fitted), color = "red", size = 0.5)

#------------------------------------------------------------------------------------------------------
# Here you need to write your explanation no R code in this part: (15 Points)
# What do you observe from the Diagnostic plots for each assumption ( is the assumption acceptable or not ? )
#
# Answer for Linearity:
# Error value are statistically independent. That is residuals are independent.
# Means that error values are independent of dependent variable(indtot)
# Answer for Normality:
#
#  As per normal Q-Q graph dependent and predicted  dependent value are normally
#  distributed.

# Answer for homoscedasticity: 
# The scale-location graph shows that the probability distribution has constant 
#  variance
#
#
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# Submitting Your Assignment
# You need to submit this R script file after you name it as firstname_lastname_HW_2.R.
# Upload the R file on Moodle.
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------