data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

od.if <- function (form, train, test, ntrees=100,...) {
  require(solitude)
  tgt <- which(colnames(train)==as.character(form[[2]]))
  
  iso = isolationForest$new(num_trees=ntrees)
  iso$fit(train,...)
  p <- iso$predict(test)
  p <- p$anomaly_score
  p <- scale(p)
  
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}

exp.od.if <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.if", 
                     ntrees=c(100, 250, 500, 1000))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
  evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.od.if, top=4, maxs=TRUE)