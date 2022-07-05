library(tidyverse)
library(FactoMineR)
library(factoextra)
library(readxl)
library(ggcorrplot)
library(scales)
library(openxlsx)
library(corrplot)

PCA_FC = FC_normalised_table %>%
  group_by(treatment, gene) %>%
  summarize(mean <- mean(FC_normalised, na.rm = TRUE))


PCA_FC %>% 
  pivot_wider(names_from = "gene",
              values_from = "mean <- mean(FC_normalised, na.rm = TRUE)") %>% 
  as.data.frame() -> FC_norm_gene_wide

FC_norm_gene_wide=t(FC_norm_gene_wide[,-1])

res.pca <- PCA(FC_norm_gene_wide)

fviz_pca_ind(res.pca, addEllipses = TRUE, label=c("ind")) 
