data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

od.lof <- function (form, train, test, threshold=1,...) {
  require(Rlof)
  tgt <- which(colnames(train)==as.character(form[[2]]))
  
  ntrain <- nrow(train)
  ntest <- nrow(test)
  df <- rbind(train, test)
  df <- df[, -tgt]
  closeAllConnections()
  df.lof <- lof(df, c(1,2,4,8,16,32), cores=1)
  p <- c()
  for (i in (ntrain+1):(ntrain+ntest)) {
    if (max(df.lof[i,]) > threshold) p <- c(p, 'pos')
    else p <- c(p, 'neg')
  }
  
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}

exp.od.lof <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.lof",
                     threshold=c(0.1, 0.5, 1,2,4))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
                 evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.od.lof, top=5, maxs=TRUE)