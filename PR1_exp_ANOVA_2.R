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

df_PR1_exp <- (PR1_exp.subtable[,-1])
df_PR1_exp <- (df_PR1_exp[,-2])

df_PR1_exp$treatment = factor(df_PR1_exp$treatment)

PR1_exp_ANOVA_result_2 = aov(exp_normalised ~ treatment, data = df_PR1_exp)

summary(PR1_exp_ANOVA_result_2)

output1 <- xtable(PR1_exp_ANOVA_result_2)
write.csv(output1, file = "PR1_exp_ANOVA_table.csv", sep = ",")

PR1_exp_Tukey <- TukeyHSD(PR1_exp_ANOVA_result_2, "treatment", ordered = TRUE)
PR1_exp_Tukey_table <- as.data.frame(PR1_exp_Tukey$treatment)

write.csv(PR1_exp_Tukey_table, file = "PR1_exp_Tukey_table.csv", sep = ",")
