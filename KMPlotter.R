# Loading required libraries
library(survival)
library(ggplot2)
library(ggsurvfit)

# loading the tab-delimited events file (the KM-Plotter text output)
# the events file must contain following columns:
# Expression (1=high) {Expression..1.high.}: which denotes the binary classes of samples based on expression
# Time (months) {Time..months}: which denotes time of event in desired timestamp
# Event: which denotes occurence of the death event in a binary format
data = read.delim("~/Path_to_events_file",sep = '\t')
data$Expression..1.high.[data$Expression..1.high.==0] = "Low expression"
data$Expression..1.high.[data$Expression..1.high.==1] = "High expression"

# Plotting
survfit2(Surv(time = Time..months.,event = Event) ~ Expression..1.high., data = data) %>% 
  ggsurvfit() +
  labs(
    x = "Months",
    y = "Event-free survival probability",
    title = "Liver cancer (n="no_of_cases", p-value="log-rank_sum_test_pvalue)"
  ) + 
  add_confidence_interval() +
  scale_color_manual(values = c('red', 'dodgerblue2'),
                     labels = c('High expression', 'Low expression')) +
  scale_fill_manual(values = c('red', 'dodgerblue2'),
                    labels = c('High expression', 'Low expression')) +
  ylim(0.0, 1.0)
