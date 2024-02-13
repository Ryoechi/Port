library(caret)
library(tidyverse)
library(MLmetrics)

mtcars <- rownames_to_column(mtcars, "model")
df_mt <- mtcars
View(df_mt)

## split data 

tts <- function(data, size=0.7){
  set.seed(12)
  n <- nrow(data)
  train_id <- sample(1:n, size*n)
  train_df <- data[train_id,]
  test_df <- data[-train_id,]
  return(list(train_df, test_df))
}

prep_df <- train_test_split(df_mt)

## train ml

model1 <- train(mpg ~ hp + wt + am, data = prep_df[[1]], method = "lm", )

## Score

score <- predict(model1, prep_df[[2]])

## Eval

model_eva <- model1[[4]] %>% select(RMSE, MAE, Rsquared)

pred_eva <- list(RMSE(y_pred = score, y_true = prep_df[[2]]$mpg),
MAE(y_pred = score, y_true = prep_df[[2]]$mpg),
R2_Score(y_pred = score, y_true = prep_df[[2]]$mpg))

add_row(model_eva, RMSE = pred_eva[[1]], MAE = pred_eva[[2]], Rsquared = pred_eva[[3]] )
