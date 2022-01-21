updateParameters <- function (grads, params, learning_rate){ 
  W1 <- params$W1 
  b1 <- params$b1 
  W2 <- params$W2 
  b2 <- params$b2 
  dW1 <- grads$dW1 
  db1 <- grads$db1 
  dW2 <- grads$dW2 
  db2 <- grads$db2 
  W1 <- W1 - learning_rate * dW1 
  b1 <- b1 - learning_rate * db1 
  W2 <- W2 - learning_rate * dW2 
  b2 <- b2 - learning_rate * db2 
  updated_params <- list("W1" = W1, 
                         "b1" = b1, 
                         "W2" = W2, 
                         "b2" = b2) 
  return (updated_params) 
} 
update_params <- updateParameters(back_prop, init_params, learning_rate = 0.01) 
lapply(update_params, function(x) dim(x))