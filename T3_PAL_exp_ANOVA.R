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

df_PAL_exp <- (T3_PAL_exp.subtable[,-2])

df_PAL_exp$treatment = factor(df_PAL_exp$treatment)

T3_PAL_exp_ANOVA_result = aov(exp_normalised ~ treatment, data = df_PAL_exp)

summary(T3_PAL_exp_ANOVA_result)

output1 <- xtable(T3_PAL_exp_ANOVA_result)
write.csv(output1, file = "T3_PAL_exp_ANOVA_table.csv", sep = ",")

PAL_exp_Tukey <- TukeyHSD(T3_PAL_exp_ANOVA_result, "treatment", ordered = TRUE)
PAL_exp_Tukey_table <- as.data.frame(PAL_exp_Tukey$treatment)

write.csv(PAL_exp_Tukey_table, file = "T3_PAL_exp_Tukey_table.csv", sep = ",")
