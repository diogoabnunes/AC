lr_model <- glm(Species ~ Sepal.Length + Sepal.Width, data = train) 
lr_model 
lr_pred <- round(as.vector(predict(lr_model, test[, 1:2]))) 
lr_pred