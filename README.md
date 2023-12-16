# KM-Plotter-Plots
This is a R repository to generate survival plots over data obtained from KM-Plotter webserver

https://kmplot.com/analysis/

Make sure to click exprt plot data to text when generating graphs since this R code gets time-to-event data from this source

KM-Plotter is a webserver using gene expression and miRNA quantification expression datasets from databases and conducting Survival Analysis (SA). Users can export time to event data from KM-Plotter outputs and this R script helps to generate survival Kaplan-Meier plots based on the extracted time-to-event data, using survival and ggsurvfit R libraries.
