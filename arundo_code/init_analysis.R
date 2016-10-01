

library(tidyverse)
library(lubridate)
library(cowplot)
library(magrittr)


arundo <- read_csv("data/p1_sensor_data.csv")
arundo <- arundo[-nrow(arundo), ]
colnames(arundo) <- ifelse(colnames(arundo)!="time", paste("sensor_", colnames(arundo), sep=""), colnames(arundo))
arundo$time <- mdy_hms(arundo$time)

################################
## Plot the time series
################################

ts_plot <- arundo %>% gather(sensor, reading, 1:5) %>%
  ggplot(aes(time, reading, color=sensor)) + geom_line() %>%

save_plot(filename = "figs/sensor_ts.pdf", plot = ts_plot, base_height = 5, base_aspect_ratio = 2)

################################
## Run linear model
################################
library(caret)


## First test running single train test phase
train_ctrl <- trainControl(method = "cv", number = 10, savePredictions="all", p = 0.01, returnResamp="all")

cv_fit <- train(sensor_62~ sensor_59+sensor_60 +sensor_61 + sensor_63, 
                    data = arundo, 
                    method = "lm",
                    trControl = train_ctrl)

print(cv_fit[["resample"]])
?train
