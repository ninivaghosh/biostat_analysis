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

df_PR3_FC <- (PR3_FC.subtable[,-1])
View(df_PR3_FC)

df_PR3_FC <- (df_PR3_FC[,-2])
View(df_PR3_FC)

df_PR3_FC$treatment = factor(df_PR3_FC$treatment)

PR3_FC_ANOVA_result_10 = aov(FC_normalised ~ treatment, data = df_PR3_FC)

summary(PR3_FC_ANOVA_result_10)

output1 <- xtable(PR3_FC_ANOVA_result_10)
write.csv(output1, file = "PR3_FC_ANOVA_table.csv", sep = ",")

PR3_FC_Tukey <-  TukeyHSD(PR3_FC_ANOVA_result_10, "treatment", ordered = TRUE)
PR3_FC_Tukey_table <- as.data.frame(PR3_FC_Tukey$treatment)

write.csv(PR3_FC_Tukey_table, file = "PR3_FC_Tukey_table.csv", sep = ",")