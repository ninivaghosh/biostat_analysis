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

df_PAL_exp <- (PAL_exp.subtable[,-1])
df_PAL_exp <- (df_PAL_exp[,-2])

df_PAL_exp$treatment = factor(df_PAL_exp$treatment)

PAL_exp_ANOVA_result_5 = aov(exp_normalised ~ treatment, data = df_PAL_exp)

summary(PAL_exp_ANOVA_result_5)

output1 <- xtable(PAL_exp_ANOVA_result_5)
write.csv(output1, file = "PAL_exp_ANOVA_table.csv", sep = ",")

PAL_exp_Tukey <- TukeyHSD(PAL_exp_ANOVA_result_5, "treatment", ordered = TRUE)
PAL_exp_Tukey_table <- as.data.frame(PAL_exp_Tukey$treatment)

write.csv(PAL_exp_Tukey_table, file = "PAL_exp_Tukey_table.csv", sep = ",")