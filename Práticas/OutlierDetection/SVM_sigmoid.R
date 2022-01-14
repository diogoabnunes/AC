data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

od.svm.sigmoid <- function (form, train, test, classMaj, n=0.1, g, c0,...) {
  require(e1071)
  tgt <- which(colnames(train)==as.character(form[[2]]))
  
  j <- which(train[,tgt]==classMaj)
  m.svm <- svm(form, train[j,],
               type='one-classification',
               kernel='sigmoid',
               nu=n,
               gamma=g,
               coef0=c0)
  p <- predict(m.svm, test)
  
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}

exp.od.svm.sigmoid <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.svm.sigmoid",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)),
                     g=c(1, 2, 4, 8, 16, 32),
                     c0=c(1, 2, 4, 8, 16, 32))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
                 evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.od.svm.sigmoid, top=324, maxs=TRUE)
