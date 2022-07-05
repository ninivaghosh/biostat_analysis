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

df_PR2_exp <- (PR2_exp.subtable[,-1])
df_PR2_exp <- (df_PR2_exp[,-2])

df_PR2_exp$treatment = factor(df_PR2_exp$treatment)

PR2_exp_ANOVA_result_3 = aov(exp_normalised ~ treatment, data = df_PR2_exp)

summary(PR2_exp_ANOVA_result_3)

output1 <- xtable(PR2_exp_ANOVA_result_3)
write.csv(output1, file = "PR2_exp_ANOVA_table.csv", sep = ",")

PR2_exp_Tukey <- TukeyHSD(PR2_exp_ANOVA_result_3, "treatment", ordered = TRUE)
PR2_exp_Tukey_table <- as.data.frame(PR2_exp_Tukey$treatment)

write.csv(PR2_exp_Tukey_table, file = "PR2_exp_Tukey_table.csv", sep = ",")
