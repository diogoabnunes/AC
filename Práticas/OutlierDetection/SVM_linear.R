data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

od.svm.linear <- function (form, train, test, classMaj, n=0.1,...) {
  require(e1071)
  tgt <- which(colnames(train)==as.character(form[[2]]))
  
  j <- which(train[,tgt]==classMaj)
  m.svm <- svm(form, train[j,],
               type='one-classification',
               kernel='linear',
               nu=n)
  p <- predict(m.svm, test)
  
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}

exp.od.svm.linear <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.svm.linear",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
                 evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.od.svm.linear, top=9, maxs=TRUE)