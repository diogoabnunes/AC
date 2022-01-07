df <- tbl_df(read.csv("german_credit.csv"))
df <- df %>% select(-default)
dfT <- as(df, "transactions")
df <- df %>% mutate(
  duration_in_month = cut(duration_in_month, 4, labels = c("short","med-short", "med-long", "long")),
  credit_amount = cut(credit_amount, 4, labels = c("small", "med-small", "med-high", "high")),
  age = cut(age, 4, labels = c("young adult", "adult", "senior", "golden")))
df <- df %>% mutate_if(is.numeric, as.factor)
dfT <- as(df, "transactions")
item_dfT <- itemInfo(dfT)
head(item_dfT)
rules <- apriori(dfT)
plot(rules)
rules.conf1 <- subset(rules, confidence == 1)
myItems <- subset(item_dfT,variables %in% c("age","personal_status_sex","job","housing","purpose"))$labels
rules <- apriori(dfT,
                 parameter = list(conf=0.6,minlen=2), # 44 rules
                 appearance = list(both = myItems,
                                   default="none"))
my.lhs <- subset(item_dfT, variables %in% c("age", "job", "housing"))$labels
my.rhs <- subset(item_dfT, variables == "purpose")$labels
rules1 <- apriori(dfT, parameter = list(confidence = 0.25, minlen = 2, support = 0.05),
                  appearance = list(lhs = my.lhs, rhs = my.rhs, default = "none"))
plot(rules1, method = "graph")
plot(rules1, method = "graph", control = list(type = "itemsets"))
plot(rules1, method = "grouped")