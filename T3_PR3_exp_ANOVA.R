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

df_PR3_exp <- (T3_PR3_exp.subtable[,-2])

df_PR3_exp$treatment = factor(df_PR3_exp$treatment)

T3_PR3_exp_ANOVA_result = aov(exp_normalised ~ treatment, data = df_PR3_exp)

summary(T3_PR3_exp_ANOVA_result)

output1 <- xtable(T3_PR3_exp_ANOVA_result)
write.csv(output1, file = "T3_PR3_exp_ANOVA_table.csv", sep = ",")

PR3_exp_Tukey <- TukeyHSD(T3_PR3_exp_ANOVA_result, "treatment", ordered = TRUE)
PR3_exp_Tukey_table <- as.data.frame(PR3_exp_Tukey$treatment)

write.csv(PR3_exp_Tukey_table, file = "T3_PR3_exp_Tukey_table.csv", sep = ",")
