# Example: Data Cleaning, Regression, and Visualization in R

# Load libraries
library(dplyr)
library(ggplot2)

# Load dataset (replace with actual data)
df <- read.csv("hiv_incidence.csv")

# Data cleaning
df <- df %>% filter(!is.na(age), !is.na(sex), !is.na(seroconversion))
df$sex <- ifelse(df$sex == "Male", 1, 0)

# Logistic regression
model <- glm(seroconversion ~ age + sex, data=df, family=binomial)
summary(model)

# Visualization
ggplot(df %>% group_by(age) %>% summarise(rate = mean(seroconversion))) +
  geom_line(aes(x=age, y=rate), color="blue") +
  geom_point(aes(x=age, y=rate), color="red") +
  labs(title="HIV Seroconversion Rate by Age",
       x="Age", y="Probability of Seroconversion") +
  theme_minimal()
