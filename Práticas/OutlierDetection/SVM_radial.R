data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

od.svm.radial <- function (form, train, test, classMaj, n=0.1, g,...) {
  require(e1071)
  tgt <- which(colnames(train)==as.character(form[[2]]))
  
  j <- which(train[,tgt]==classMaj)
  m.svm <- svm(form, train[j,],
               type='one-classification',
               kernel='radial',
               nu=n,
               gamma=g)
  p <- predict(m.svm, test)
  
  res <- list(trues=test[,tgt], preds=p) # p must be defined
  res
}

exp.od.svm.radial <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.svm.radial",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)),
                     g=c(1, 2, 4, 8, 16, 32))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
                 evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.od.svm.radial, top=54, maxs=TRUE)