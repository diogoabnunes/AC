computeCost <- function(X, y, cache) { 
  m <- dim(X)[2] 
  A2 <- cache$A2 
  logprobs <- (log(A2) * y) + (log(1-A2) * (1-y)) 
  cost <- -sum(logprobs/m) 
  return (cost) 
} 
cost <- computeCost(X_train, y_train, fwd_prop) 
cost