forwardPropagation <- function(X, params, list_layer_size){ 
  m <- dim(X)[2] 
  n_h <- list_layer_size$n_h 
  n_y <- list_layer_size$n_y 
  W1 <- params$W1 
  b1 <- params$b1 
  W2 <- params$W2 
  b2 <- params$b2 
  b1_new <- matrix(rep(b1, m), nrow = n_h) 
  b2_new <- matrix(rep(b2, m), nrow = n_y) 
  Z1 <- W1 %*% X + b1_new 
  A1 <- sigmoid(Z1) 
  Z2 <- W2 %*% A1 + b2_new 
  A2 <- sigmoid(Z2) 
  cache <- list("Z1" = Z1, 
                "A1" = A1,  
                "Z2" = Z2, 
                "A2" = A2) 
  
  return (cache) 
} 
fwd_prop <- forwardPropagation(X_train, init_params, layer_size)
lapply(fwd_prop, function(x) dim(x))