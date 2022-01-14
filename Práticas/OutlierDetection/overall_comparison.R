data("PimaIndiansDiabetes")
dataset <- PimaIndiansDiabetes
formula <- diabetes ~.

exp.overall <- performanceEstimation::performanceEstimation(
  PredTask(formula, dataset),
  c(workflowVariants("od.if", 
                     ntrees=c(100, 250, 500, 1000))),
  c(workflowVariants("od.svm.linear",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)))),
  c(workflowVariants("od.svm.radial",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)),
                     g=c(1, 2, 4, 8, 16, 32))),
  c(workflowVariants("od.svm.sigmoid",
                     classMaj='neg',
                     n=c(seq(0.1, 0.9, by=0.1)),
                     g=c(1, 2, 4, 8, 16, 32),
                     c0=c(1, 2, 4, 8, 16, 32))),
  c(workflowVariants("od.lof",
                     threshold=c(0.1, 0.5, 1,2,4))),
  EstimationTask(metrics="auc", method=CV(nReps=1, nFolds=10),
                 evaluator="AUC")
)
performanceEstimation::rankWorkflows(exp.overall, top=500, maxs=TRUE)