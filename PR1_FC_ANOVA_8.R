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

df_PR1_FC <- (PR1_FC.subtable[,-1])
View(df_PR1_FC)

df_PR1_FC <- (df_PR1_FC[,-2])
View(df_PR1_FC)

df_PR1_FC$treatment = factor(df_PR1$treatment)

PR1_FC_ANOVA_result_8 = aov(FC_normalised ~ treatment, data = df_PR1_FC)

summary(PR1_FC_ANOVA_result_8)

output1 <- xtable(PR1_FC_ANOVA_result_8)
write.csv(output1, file = "PR1_FC_ANOVA_table.csv", sep = ",")

PR1_FC_Tukey <-  TukeyHSD(PR1_FC_ANOVA_result_8, "treatment", ordered = TRUE)
PR1_FC_Tukey_table <- as.data.frame(PR1_FC_Tukey$treatment)

write.csv(PR1_FC_Tukey_table, file = "PR1_FC_Tukey_table.csv", sep = ",")