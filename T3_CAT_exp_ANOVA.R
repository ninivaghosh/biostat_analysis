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

df_CAT_exp <- (T3_CAT_exp.subtable[,-2])

df_CAT_exp$treatment = factor(df_CAT_exp$treatment)

T3_CAT_exp_ANOVA_result = aov(exp_normalised ~ treatment, data = df_CAT_exp)

summary(T3_CAT_exp_ANOVA_result)

output1 <- xtable(T3_CAT_exp_ANOVA_result)
write.csv(output1, file = "T3_CAT_exp_ANOVA_table.csv", sep = ",")

CAT_exp_Tukey <- TukeyHSD(T3_CAT_exp_ANOVA_result, "treatment", ordered = TRUE)
CAT_exp_Tukey_table <- as.data.frame(CAT_exp_Tukey$treatment)

write.csv(CAT_exp_Tukey_table, file = "T3_CAT_exp_Tukey_table.csv", sep = ",")
