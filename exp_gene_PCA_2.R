library(tidyverse)
library(FactoMineR)
library(factoextra)
library(readxl)
library(ggcorrplot)
library(scales)
library(openxlsx)
library(corrplot)

PCA_exp = exp_normalised_table %>%
  group_by(treatment, gene) %>%
  summarize(mean <- mean(exp_normalised, na.rm = TRUE))


PCA_exp %>% 
  pivot_wider(names_from = "gene",
              values_from = "mean <- mean(exp_normalised, na.rm = TRUE)") %>% 
  as.data.frame() -> exp_norm_gene_wide

exp_norm_gene_wide=t(exp_norm_gene_wide[,-1])

res.pca <- PCA(exp_norm_gene_wide)

fviz_pca_ind(res.pca, addEllipses = TRUE, label=c("ind")) 
