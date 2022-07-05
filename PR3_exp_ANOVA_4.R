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

df_PR3_exp <- (PR3_exp.subtable[,-1])
df_PR3_exp <- (df_PR3_exp[,-2])

df_PR3_exp$treatment = factor(df_PR3_exp$treatment)

PR3_exp_ANOVA_result_4 = aov(exp_normalised ~ treatment, data = df_PR3_exp)

summary(PR3_exp_ANOVA_result_4)

output1 <- xtable(PR3_exp_ANOVA_result_4)
write.csv(output1, file = "PR3_exp_ANOVA_table.csv", sep = ",")

PR3_exp_Tukey <- TukeyHSD(PR3_exp_ANOVA_result_4, "treatment", ordered = TRUE)
PR3_exp_Tukey_table <- as.data.frame(PR3_exp_Tukey$treatment)

write.csv(PR3_exp_Tukey_table, file = "PR3_exp_Tukey_table.csv", sep = ",")
