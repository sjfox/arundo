
library(data.table)

arundo <- fread("data/CLASS_sensor_data.csv", header=T, skip=1, drop=c(1), data.table=FALSE)

arundo <- t(arundo)

arundo <- as.data.frame(arundo, row.names = NULL)
arundo$time <- rownames(arundo)
rownames(arundo) <- NULL
head(arundo)
colnames(arundo) <- arundo[1,]
colnames(arundo)[length(colnames(arundo))] <- "time"

arundo <- arundo[-1, ]
head(arundo)
write_csv(arundo, "data/sensor_data_transposed.csv")

library(tidyverse)
sensor_only <- arundo %>% select("59":"63", time)
write_csv(sensor_only, "data/p1_sensor_data.csv")

temp <- read_csv("data/p1_sensor_data.csv")
