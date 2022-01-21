layer_size <- getLayerSize(X_test, y_test, HIDDEN_NEURONS) 
params <- train_model$updated_params 
fwd_prop <- forwardPropagation(X_test, params, layer_size) 
y_pred <- round(fwd_prop$A2)