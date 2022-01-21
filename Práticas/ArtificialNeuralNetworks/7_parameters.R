initializeParameters <- function(X, list_layer_size){ 
  m <- dim(data.matrix(X))[2] 
  n_x <- list_layer_size$n_x 
  n_h <- list_layer_size$n_h 
  n_y <- list_layer_size$n_y 
  W1 <- matrix(runif(n_h * n_x), nrow = n_h, ncol = n_x, byrow = TRUE) * 0.01 
  b1 <- matrix(rep(0, n_h), nrow = n_h) 
  W2 <- matrix(runif(n_y * n_h), nrow = n_y, ncol = n_h, byrow = TRUE) * 0.01 
  b2 <- matrix(rep(0, n_y), nrow = n_y) 
  params <- list("W1" = W1, 
                 "b1" = b1,  
                 "W2" = W2, 
                 "b2" = b2) 
  return (params) 
} 
init_params <- initializeParameters(X_train, layer_size) 
lapply(init_params, function(x) dim(x))