library(performanceEstimation)
library(mlbench)
library(Rcpp)
example <- function (form, train, test, opt=1,...) {
  tgt <- which(colnames(train)==as.character(form[[2]]))
  # ... to be done
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}
# Function to calculate AUC
AUC <- function(trues, preds, ...) {
  library(AUC) # install.packages("AUC")
  c(auc=AUC::auc(roc(preds,trues)))
}
exp1 <- performanceEstimation::performanceEstimation(
  PredTask(formula,dataset), # formula and dataset must be defined
  c(workflowVariantes("example",opt=c(1,2,3))),
  # example is the name of the function previously defined
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10), evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp1, top=3, maxs=TRUE)