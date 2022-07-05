library(ggcorrplot)
library(scales)
library(openxlsx)
library(corrplot)
library(bestNormalize)
library(car)
library (ggplot2)
library(dplyr)
library(tidyr)
require(data.table)
library("FactoMineR")
library("factoextra")
library(xtable)

df_PR3_exp <- (T4_PR3_exp[,-2])

df_PR3_exp$treatment = factor(df_PR3_exp$treatment)

T4_PR3_exp_ANOVA_result = aov(exp_normalised ~ treatment, data = df_PR3_exp)

summary(T4_PR3_exp_ANOVA_result)

output1 <- xtable(T4_PR3_exp_ANOVA_result)
write.csv(output1, file = "T4_PR3_exp_ANOVA_table.csv", sep = ",")