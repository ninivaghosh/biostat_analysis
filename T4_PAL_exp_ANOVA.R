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

df_PAL_exp <- (T4_PAL_exp[,-2])

df_PAL_exp$treatment = factor(df_PAL_exp$treatment)

T4_PAL_exp_ANOVA_result = aov(exp_normalised ~ treatment, data = df_PAL_exp)

summary(T4_PAL_exp_ANOVA_result)

output1 <- xtable(T4_PAL_exp_ANOVA_result)
write.csv(output1, file = "T4_PAL_exp_ANOVA_table.csv", sep = ",")