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

df_PAL_FC <- (T3_PAL_FC[,-2])

df_PAL_FC$treatment = factor(df_PAL_FC$treatment)

T3_PAL_FC_ANOVA_result = aov(FC_normalised ~ treatment, data = df_PAL_FC)

summary(T3_PAL_FC_ANOVA_result)

output1 <- xtable(T3_PAL_FC_ANOVA_result)
write.csv(output1, file = "T3_PAL_FC_ANOVA_table.csv", sep = ",")

PAL_FC_Tukey <-  TukeyHSD(T3_PAL_FC_ANOVA_result, "treatment", ordered = TRUE)
PAL_FC_Tukey_table <- as.data.frame(PAL_FC_Tukey$treatment)

write.csv(PAL_FC_Tukey_table, file = "T3_PAL_FC_Tukey_table.csv", sep = ",")