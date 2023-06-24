## Homework estimate House Price

## get data
library(readxl)
House_Price_India <- read_excel("House Price India.xlsx")
View(House_Price_India)

## rename column 
# 1. rename column living area
colnames(House_Price_India)[5] <- "area"
colnames(House_Price_India)[3] <- "num_bed"
colnames(House_Price_India)[7] <- "num_floors"
colnames(House_Price_India)[12] <- "area_h_ex"
colnames(House_Price_India)[22] <- "dis_airport"

View(House_Price_India)
## create log price as a new column because
## price is not normal distribution
help(log)
House_Price_India$log_price <- log(House_Price_India$Price)
View(House_Price_India)

## do a linear regression to estimate house price
library(caret)
library(tidyverse)

glimpse(House_Price_India)

# 1. split data 
# create train test split function 
train_test_split <- function(data, trainRatio = 0.8) {
  set.seed(42)
  (n <- nrow(data))
  (id <- sample(1:n, size = trainRatio*n))
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return( list(train=train_data, test=test_data))
}

set.seed(42)
splitData <- train_test_split(House_Price_India, 0.8)
train_data <- splitData$train
test_data <- splitData$test

# 2. train model (linear regression)
set.seed(42)

ctrl <- trainControl(
  method = "CV",
  number = 5, 
  verboseIter = TRUE
)

model <- train( log_price ~ num_bed + area + num_floors + 
                  area_h_ex + dis_airport,
                data = train_data,
                method = "lm",
                trControl = ctrl)

model
     
# 3. score model
p <- predict(model, newdata = test_data)

# 4. evaluate model 
RMSE(p, test_data$log_price)
MAE(p, test_data$log_price)
