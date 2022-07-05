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

df_CAT_exp <- (CAT_exp.subtable[,-1])
df_CAT_exp <- (df_CAT_exp[,-2])

df_CAT_exp$treatment = factor(df_CAT_exp$treatment)

CAT_exp_ANOVA_result_6 = aov(exp_normalised ~ treatment, data = df_CAT_exp)

summary(CAT_exp_ANOVA_result_6)

output1 <- xtable(CAT_exp_ANOVA_result_6)
write.csv(output1, file = "CAT_exp_ANOVA_table.csv", sep = ",")

CAT_exp_Tukey <- TukeyHSD(CAT_exp_ANOVA_result_6, "treatment", ordered = TRUE)
CAT_exp_Tukey_table <- as.data.frame(CAT_exp_Tukey$treatment)

write.csv(CAT_exp_Tukey_table, file = "CAT_exp_Tukey_table.csv", sep = ",")