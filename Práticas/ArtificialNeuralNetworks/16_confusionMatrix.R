tb_nn <- table(y_test, y_pred) 
tb_lr <- table(y_test, lr_pred) 

cat("NN Confusion Matrix: \n") 
## NN Confusion Matrix: 
tb_nn 
cat("\nLR Confusion Matrix: \n") 
tb_lr 
calculate_stats <- function(tb, model_name) { 
  acc <- (tb[1] + tb[4])/(tb[1] + tb[2] + tb[3] + tb[4]) 
  recall <- tb[4]/(tb[4] + tb[3]) 
  precision <- tb[4]/(tb[4] + tb[2]) 
  f1 <- 2 * ((precision * recall) / (precision + recall)) 
  
  cat(model_name, ": \n") 
  cat("\tAccuracy = ", acc*100, "%.") 
  cat("\n\tPrecision = ", precision*100, "%.") 
  cat("\n\tRecall = ", recall*100, "%.") 
  cat("\n\tF1 Score = ", f1*100, "%.\n\n") 
} 
calculate_stats(tb_nn,"NN") 
calculate_stats(tb_lr,"LR")