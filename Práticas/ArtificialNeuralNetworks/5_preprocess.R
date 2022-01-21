attributeX_train <- scale(train[, c(1:2)]) 
y_train <- train$Species 
dim(y_train) <- c(length(y_train), 1) # add extra dimension to vector 
X_test <- scale(test[, c(1:2)]) 
y_test <- test$Species 
dim(y_test) <- c(length(y_test), 1) # add extra dimension to vector 
X_train <- as.matrix(attributeX_train, byrow=TRUE) 
X_train <- t(X_train) 
y_train <- as.matrix(y_train, byrow=TRUE) 
y_train <- t(y_train) 
X_test <- as.matrix(X_test, byrow=TRUE) 
X_test <- t(X_test) 
y_test <- as.matrix(y_test, byrow=TRUE) 
y_test <- t(y_test)