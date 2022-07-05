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

df_CAT_FC <- (T3_CAT_FC[,-2])

df_CAT_FC$treatment = factor(df_CAT_FC$treatment)

T3_CAT_FC_ANOVA_result = aov(FC_normalised ~ treatment, data = df_CAT_FC)

summary(T3_CAT_FC_ANOVA_result)

output1 <- xtable(T3_CAT_FC_ANOVA_result)
write.csv(output1, file = "T3_CAT_FC_ANOVA_table.csv", sep = ",")

CAT_FC_Tukey <-  TukeyHSD(T3_CAT_FC_ANOVA_result, "treatment", ordered = TRUE)
CAT_FC_Tukey_table <- as.data.frame(CAT_FC_Tukey$treatment)

write.csv(CAT_FC_Tukey_table, file = "T3_CAT_FC_Tukey_table.csv", sep = ",")