getLayerSize <- function(X, y, hidden_neurons) { 
  n_x <- dim(X)[1] 
  n_h <- hidden_neurons 
  n_y <- dim(y)[1]    
  size <- list("n_x" = n_x, 
               "n_h" = n_h, 
               "n_y" = n_y) 
  return(size) 
} 
layer_size <- getLayerSize(X_train, y_train, hidden_neurons = 4) 
layer_size