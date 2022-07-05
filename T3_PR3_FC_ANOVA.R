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

df_PR3_FC <- (T3_PR3_FC[,-2])

df_PR3_FC$treatment = factor(df_PR3_FC$treatment)

T3_PR3_FC_ANOVA_result = aov(FC_normalised ~ treatment, data = df_PR3_FC)

summary(T3_PR3_FC_ANOVA_result)

output1 <- xtable(T3_PR3_FC_ANOVA_result)
write.csv(output1, file = "T3_PR3_FC_ANOVA_table.csv", sep = ",")

PR3_FC_Tukey <-  TukeyHSD(T3_PR3_FC_ANOVA_result, "treatment", ordered = TRUE)
PR3_FC_Tukey_table <- as.data.frame(PR3_FC_Tukey$treatment)

write.csv(PR3_FC_Tukey_table, file = "T3_PR3_FC_Tukey_table.csv", sep = ",")