library(survival)
library(ggplot2)
library(ggsurvfit)
data = read.delim("C:/Users/sh/Downloads/Old Laptop/EPFL/KMPlotter Survival/New folder/Liver PFS.txt",sep = '\t')
data$Expression..1.high.[data$Expression..1.high.==0] = "Low Basophil"
data$Expression..1.high.[data$Expression..1.high.==1] = "High Basophil"

survfit2(Surv(time = Time..months.,event = Event) ~ Expression..1.high., data = data) %>% 
  ggsurvfit() +
  labs(
    x = "Months",
    y = "Event-free survival probability",
    title = "Liver cancer (n=370, p-value=0.0767)"
  ) + 
  add_confidence_interval() +
  scale_color_manual(values = c('red', 'dodgerblue2'),
                     labels = c('High Basophil', 'Low Basophil')) +
  scale_fill_manual(values = c('red', 'dodgerblue2'),
                    labels = c('High Basophil', 'Low Basophil')) +
  ylim(0.0, 1.0)
