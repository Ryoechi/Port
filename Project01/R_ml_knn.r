library(tidyverse)
library(caret)
library(mlbench)
library(MLmetrics)

data("PimaIndiansDiabetes")
pd <- PimaIndiansDiabetes

## explore dataset

glimpse(pd)

## check missing value

mean(complete.cases(pd))

## select variable

df_starter <- pd %>%
  select(2,5,6,8,diabetes)

df_starter %>% 
  group_by(diabetes) %>%
  summarise(mean(age),mean(mass))

## 1. split data
set.seed(29)
n <- nrow(df_starter)
id <- sample(1:n, size=n*0.8)
train_df <- df_starter[id,]
test_df <- df_starter[-id,]

## 2. train data

ctrl <- trainControl(method = "cv", number = 5, verboseIter = TRUE
                     ,summaryFunction = prSummary, classProbs = TRUE)

set.seed(29)
knn_model <- train(diabetes ~ .,
                     data = train_df,
                     method = "knn",
                     metric = "Recall",
                     trControl = ctrl,
                     tuneLength = 5
                     )

## 3. score

p <- predict(knn_model, newdata = test_df)

## 4. evaluate

mean(p == test_df$diabetes)

## 5. confusion matrix

confusionMatrix(p, test_df$diabetes, positive = "pos", mode="prec_recall")
