library(dplyr)
library(readr)
d <- read.csv("log.csv")
d %>% group_by(PAGE) %>% tally()
d %>% group_by(PAGE) %>% tally(sort=TRUE)
d %>% group_by(PAGE) %>% tally(sort=TRUE) %>% top_n(3) %>% pull(PAGE)
dat <-table(d$USER,d$PAGE)
dat
library(proxy)
dm <- dist(dat) #euclidean
summary(pr_DB)
dm <- dist(dat,method="jaccard")
dm
c1 <- hclust(dm)
plot(c1)
plot(c1, hang = -0.1)
cm <- cutree(c1,2)
cm
plot(c1,hang=-0.1)
rect.hclust(c1,2)
dd <- mutate(d, Cluster=cm[d$USER]) # adding the cluster of each user
dd
filter(dd,Cluster==1) %>% pull(PAGE) # the answer (the pages)
filter(dd,Cluster==1) %>% group_by(PAGE) %>% tally()
filter(dd,Cluster==1) %>% group_by(PAGE) %>% tally(sort=TRUE)
filter(dd,Cluster==1) %>%
  group_by(PAGE) %>% tally(sort=TRUE) %>% top_n(2) %>% pull(PAGE)
filter(dd,Cluster==2) %>%
  group_by(PAGE) %>% tally(sort=TRUE) %>% top_n(2) %>% pull(PAGE)
cluster.u2 <- dd %>% filter(USER == "u2") %>% select(Cluster) %>% head(1) %>% pull()
rec.u2 <- filter(dd,Cluster==cluster.u2) %>%
  group_by(PAGE) %>% tally(sort=TRUE) %>% top_n(3) %>% select(PAGE)
seen.u2 <- dd %>% filter(USER == "u2") %>% select(PAGE)
anti_join(rec.u2,seen.u2)