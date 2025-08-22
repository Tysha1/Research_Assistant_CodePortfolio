// Example: Data Cleaning, Regression, and Visualization in Stata

* Load dataset (replace with actual data)
import delimited hiv_incidence.csv, clear

* Data cleaning
drop if missing(age, sex, seroconversion)
gen sex_binary = (sex == "Male")

* Logistic regression
logit seroconversion age sex_binary
estimates store logit_model

* Visualization: Seroconversion rate by age
collapse (mean) seroconversion, by(age)
twoway (line seroconversion age, sort lcolor(blue) lwidth(medthick)) ///
       (scatter seroconversion age, mcolor(red)), ///
       title("HIV Seroconversion Rate by Age") ///
       xtitle("Age") ytitle("Probability of Seroconversion")
