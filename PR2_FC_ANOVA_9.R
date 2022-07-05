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

df_PR2_FC <- (PR2_FC.subtable[,-1])
View(df_PR2_FC)

df_PR2_FC <- (df_PR2_FC[,-2])
View(df_PR2_FC)

df_PR2_FC$treatment = factor(df_PR2_FC$treatment)

PR2_FC_ANOVA_result_9 = aov(FC_normalised ~ treatment, data = df_PR2_FC)

summary(PR2_FC_ANOVA_result_9)

output1 <- xtable(PR2_FC_ANOVA_result_9)
write.csv(output1, file = "PR2_FC_ANOVA_table.csv", sep = ",")

PR2_FC_Tukey <-  TukeyHSD(PR2_FC_ANOVA_result_9, "treatment", ordered = TRUE)
PR2_FC_Tukey_table <- as.data.frame(PR2_FC_Tukey$treatment)

write.csv(PR2_FC_Tukey_table, file = "PR2_FC_Tukey_table.csv", sep = ",")