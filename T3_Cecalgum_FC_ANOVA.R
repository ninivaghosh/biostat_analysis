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

df_Cecalgum_FC <- (T3_Cecalgum_FC[,-1])

df_Cecalgum_FC$gene = factor(df_Cecalgum_FC$gene)

T3_Cecalgum_FC_ANOVA_result = aov(FC_normalised ~ gene, data = df_Cecalgum_FC)

summary(T3_Cecalgum_FC_ANOVA_result)

output1 <- xtable(T3_Cecalgum_FC_ANOVA_result)
write.csv(output1, file = "T3_Cecalgum_FC_ANOVA_table.csv", sep = ",")

Cecalgum_FC_Tukey <-  TukeyHSD(T3_Cecalgum_FC_ANOVA_result, "gene", ordered = TRUE)
Cecalgum_FC_Tukey_table <- as.data.frame(Cecalgum_FC_Tukey$gene)

write.csv(Cecalgum_FC_Tukey_table, file = "T3_Cecalgum_FC_Tukey_table.csv", sep = ",")