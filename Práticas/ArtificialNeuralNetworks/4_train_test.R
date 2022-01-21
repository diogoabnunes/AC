dataset <- dataset[sample(nrow(dataset)), ]
train_test_split_index <- 0.8 * nrow(dataset) 
train <- dataset[1:train_test_split_index,] 
head(train) 
test <- dataset[(train_test_split_index+1):nrow(dataset),] 
head(test)