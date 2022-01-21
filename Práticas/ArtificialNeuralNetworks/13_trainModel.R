trainModel <- function(X, y, num_iteration, hidden_neurons, lr){ 
  layer_size <- getLayerSize(X, y, hidden_neurons) 
  init_params <- initializeParameters(X, layer_size) 
  cost_history <- c() 
  for (i in 1:num_iteration) { 
    fwd_prop <- forwardPropagation(X, init_params, layer_size) 
    cost <- computeCost(X, y, fwd_prop) 
    back_prop <- backwardPropagation(X, y, fwd_prop, init_params, layer_size) 
    update_params <- updateParameters(back_prop, init_params, learning_rate = lr) 
    init_params <- update_params 
    cost_history <- c(cost_history, cost) 
    if (i %% 10000 == 0) cat("Iteration", i, " | Cost: ", cost, "\n") 
  } 
  model_out <- list("updated_params" = update_params, 
                    "cost_hist" = cost_history) 
  return (model_out) 
} 
EPOCHS = 60000 
HIDDEN_NEURONS = 40 
LEARNING_RATE = 0.1 

train_model <- trainModel(X_train, y_train, hidden_neurons = HIDDEN_NEURONS, 
                          num_iteration = EPOCHS, lr = LEARNING_RATE)