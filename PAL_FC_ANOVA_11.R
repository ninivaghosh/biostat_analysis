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

df_PAL_FC <- (PAL_FC.subtable[,-1])
df_PAL_FC <- (df_PAL_FC[,-2])

df_PAL_FC$treatment = factor(df_PAL_FC$treatment)

PAL_FC_ANOVA_result_11 = aov(FC_normalised ~ treatment, data = df_PAL_FC)

summary(PAL_FC_ANOVA_result_11)

output1 <- xtable(PAL_FC_ANOVA_result_11)
write.csv(output1, file = "PAL_FC_ANOVA_table.csv", sep = ",")

PAL_FC_Tukey <-  TukeyHSD(PAL_FC_ANOVA_result_11, "treatment", ordered = TRUE)
PAL_FC_Tukey_table <- as.data.frame(PAL_FC_Tukey$treatment)

write.csv(PAL_FC_Tukey_table, file = "PAL_FC_Tukey_table.csv", sep = ",")