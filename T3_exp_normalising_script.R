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
# mes_donnees is the name of the variable corresponding to my original data
# the symbol %>% is intended for piping 
# the "bestNormalize" is package for normalization. the original data is transformed 
#in a way to fit the gaussian distribution

T3_exp_crude %>%
  select(exp) %>% 
  unlist() %>% 
  bestNormalize(standardize = TRUE, k = 10, r = 5, warn = FALSE) -> modelDataAcp.mes_donnees

T3_exp_crude %>% 
  mutate(exp_normalised = predict(modelDataAcp.mes_donnees)) %>% 
  select(-exp) -> T3_exp_normalised_table
View(T3_exp_normalised_table)


write.table(T3_exp_normalised_table, file="T3_exp_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(T3_exp_normalised_table, file = "T3_exp_normalised_table.xlsx")


shapiro.test(T3_exp_normalised_table$exp_normalised)

T3_exp_normalised_table %>% shapiro.test(exp_normalised)

bartlett.test(T3_exp_normalised_table$exp_normalised ~T3_exp_normalised_table$treatment)

leveneTest(exp_normalised ~ treatment, data = T3_exp_normalised_table)
plot(density(T3_exp_normalised_table$exp_normalised))

write.table(T3_exp_normalised_table, file="T3_exp_normalised_table.txt", sep = "\t", quote = FALSE, row.names = F, col.names = T)
write.xlsx(T3_exp_normalised_table, file = "T3_exp_normalised_table.xlsx")