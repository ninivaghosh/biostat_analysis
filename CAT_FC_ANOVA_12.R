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

df_CAT_FC <- (CAT_FC.subtable[,-1])
df_CAT_FC <- (df_CAT_FC[,-2])

df_CAT_FC$treatment = factor(df_CAT_FC$treatment)

CAT_FC_ANOVA_result_12 = aov(FC_normalised ~ treatment, data = df_CAT_FC)

summary(CAT_FC_ANOVA_result_12)

output1 <- xtable(CAT_FC_ANOVA_result_12)
write.csv(output1, file = "CAT_FC_ANOVA_table.csv", sep = ",")

CAT_FC_Tukey <-  TukeyHSD(CAT_FC_ANOVA_result_12, "treatment", ordered = TRUE)
CAT_FC_Tukey_table <- as.data.frame(CAT_FC_Tukey$treatment)

write.csv(CAT_FC_Tukey_table, file = "CAT_FC_Tukey_table.csv", sep = ",")