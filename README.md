# KM-Plotter-Plots
This is a R repository to generate survival plots over data obtained from KM-Plotter webserver

https://kmplot.com/analysis/

Make sure to click exprt plot data to text when generating graphs since this R code gets time-to-event data from this source

KM-Plotter is a webserver using gene expression and miRNA quantification expression datasets from databases and conducting Survival Analysis (SA). Users can export time to event data from KM-Plotter outputs and this R script helps to generate survival Kaplan-Meier plots based on the extracted time-to-event data, using survival and ggsurvfit R libraries.

```R
# loading required R libraries
library(survival)
library(ggplot2)
library(ggsurvfit)

# Reading the time-to-event data, extracted from KM-Plotter web server
data = read.delim("C:/Users/sh/Downloads/Old Laptop/EPFL/KMPlotter Survival/KMPlotter AutoCutoff/Liv.txt",sep = '\t')
data$Expression..1.high.[data$Expression..1.high.==0] = "Low Basophil"
data$Expression..1.high.[data$Expression..1.high.==1] = "High Basophil"

# creating the survival plot object using ggsurvfit library and plotting using ggplot library
survfit2(Surv(time = Time..months.,event = Event) ~ Expression..1.high., data = data) %>% 
  ggsurvfit() +
  labs(
    x = "Months",
    y = "Overall survival probability",
    title = "Myeloma (n=1416, p-value=1.0e-6)"
  ) + 
  add_confidence_interval() +
  scale_color_manual(values = c('red', 'dodgerblue2'),
                     labels = c('High Basophil', 'Low Basophil')) +
  scale_fill_manual(values = c('red', 'dodgerblue2'),
                    labels = c('High Basophil', 'Low Basophil')) +
  ylim(0.0, 1.0)
```
