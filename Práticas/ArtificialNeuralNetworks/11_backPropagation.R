backwardPropagation <- function(X, y, cache, params, list_layer_size){ 
  m <- dim(X)[2] 
  n_x <- list_layer_size$n_x 
  n_h <- list_layer_size$n_h 
  n_y <- list_layer_size$n_y 
  A2 <- cache$A2 
  A1 <- cache$A1 
  W2 <- params$W2 
  dZ2 <- A2 - as.vector(y) 
  dW2 <- 1/m * (dZ2 %*% t(A1))  
  db2 <- matrix(1/m * sum(dZ2), nrow = n_y) 
  db2_new <- matrix(rep(db2, m), nrow = n_y) 
  dZ1 <- (t(W2) %*% dZ2) * (1 - A1^2) 
  dW1 <- 1/m * (dZ1 %*% t(X)) 
  db1 <- matrix(1/m * sum(dZ1), nrow = n_h) 
  db1_new <- matrix(rep(db1, m), nrow = n_h) 
  grads <- list("dW1" = dW1,  
                "db1" = db1, 
                "dW2" = dW2, 
                "db2" = db2) 
  return(grads) 
} 
back_prop<-backwardPropagation(X_train,y_train,fwd_prop,init_params,layer_size) 
lapply(back_prop, function(x) dim(x))