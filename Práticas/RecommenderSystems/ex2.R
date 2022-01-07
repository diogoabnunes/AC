library(recommenderlab)
log <- read_csv("log1.csv",col_types = list(col_factor(),col_factor()))
brm <- as(as.data.frame(log),"binaryRatingMatrix")
brm_offline <- brm[1:6,]
getData.frame(brm_offline)
getRatingMatrix(brm_offline)
inspect(getRatingMatrix(brm_offline))
rowCounts(brm_offline)
colCounts(brm_offline)
image(brm_offline)
model <- Recommender(brm_offline, "AR")
getModel(model)
rules <- getModel(model)$rule_base
inspect(rules)
predicts <- predict(model, newdata = brm[7])
getList(predicts)
brm_u7 <- brm[7,]
recsAR <- predict(model, brm_u7, n=2)
recsAR
getList(recsAR)
r <- subset(rules,lhs %in% c("C","F"))
inspect(r)
brm_u8 <- brm[8,]
recsAR <- predict(model, brm_u8, n=2)
recsAR
getList(recsAR)
r <- subset(rules,lhs %in% c("C"))
inspect(r)
recommenderRegistry$get_entries(dataType ="binaryRatingMatrix")
modelPop <- Recommender(brm_offline,"POPULAR")
recsPop <- predict(modelPop, brm[7:8,], n=2)
recsPop
getList(recsPop)
