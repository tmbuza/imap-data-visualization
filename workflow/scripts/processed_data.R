if (!dir.exists("data")){dir.create("data")}

library(microbiomeMarker)
library(phyloseq)
suppressPackageStartupMessages(library(microViz)) # Not in CRAN yet
library(metagMisc) # Not in CRAN yet
library(qiime2R) # Not in CRAN yet
library(metagenomeSeq)
suppressPackageStartupMessages(library(tidyverse))
library(corncob) # Not in CRAN yet


# Dataset 1
library(phyloseq)
data("GlobalPatterns")
ps_GlobalPatterns <-GlobalPatterns
df_GlobalPatterns <-GlobalPatterns %>% 
  phyloseq::psmelt() %>% 
  tibble::rownames_to_column("sample_id") %>% 
  rename_all(tolower)

colnames(df_GlobalPatterns) %>% as.data.frame()


# Dataset 2
library(corncob)
data("ibd_phylo")
ps_ibd_phylo <-ibd_phylo
df_ibd_phylo <-ibd_phylo %>% 
  phyloseq::psmelt() %>% 
  select(-sample) %>% 
  tibble::rownames_to_column("sample_id") %>% 
  rename_all(tolower)

colnames(df_ibd_phylo) %>% as.data.frame()


# Dataset 3
library(microbiome)
data("dietswap")
ps_dietswap <-dietswap
df_dietswap <-dietswap %>% 
  phyloseq::psmelt() %>% 
  select(-sample) %>% 
  tibble::rownames_to_column("sample_id") %>% 
  rename_all(tolower)

colnames(df_dietswap) %>% as.data.frame()


# Dataset 4
library(microbiomeMarker)
data("caporaso")
ps_caporaso <-caporaso
df_caporaso <-caporaso %>% 
  phyloseq::psmelt() %>% 
  tibble::rownames_to_column("sample_id") %>% 
  rename_all(tolower)


colnames(df_caporaso) %>% as.data.frame()

# Dataset 5
library(microbiomeMarker)
data("kostic_crc")
ps_kostic_crc <-kostic_crc
df_kostic_crc <-kostic_crc %>% 
  phyloseq::psmelt() %>% 
  tibble::rownames_to_column("sample_id") %>% 
  rename_all(tolower)

colnames(df_kostic_crc) %>% as.data.frame()



#-------------------------------------
save(df_GlobalPatterns, 
     df_ibd_phylo, 
     df_dietswap,  
     df_caporaso,
     df_kostic_crc,

     ps_GlobalPatterns, 
     ps_ibd_phylo, 
     ps_dietswap,
     ps_caporaso,
     ps_kostic_crc,
     file = "data/processed_objects.rda")
#-------------------------------------


if (!dir.exists("data")) {dir.create("data")}

## Download QIIME2 demo datasets
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/table.qza", "data/feature_table.qza")
download.file("https://data.qiime2.org/2018.4/tutorials/moving-pictures/sample_metadata.tsv", "data/sample_metadata.tsv")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/taxonomy.qza", "data/taxonomy.qza")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/rooted-tree.qza", "data/rooted_tree.qza")
download.file("https://docs.qiime2.org/2018.4/data/tutorials/moving-pictures/core-metrics-results/shannon_vector.qza", "data/shannon_vector.qza")

# load("data/processed_objects.rda", verbose=TRUE)


# R -e 'remotes::install_github("jbisanz/qiime2R")'s
# R -e 'remotes::install_github("david-barnett/microViz")'
# R -e 'remotes::install_github("vmikk/metagMisc")'
# R -e 'remotes::install_github("bryandmartin/corncob")'
# R -e 'remotes::install_github("pablo14/funModeling")'
# R -e 'remotes::install_github("cran/cgwtools")'
# R -e 'remotes::install_github("jeroen/jsonlite")'
# R -e 'remotes::install_github("Russel88/MicEco")'
# R -e 'remotes::install_github("guokai8/microbial")'
# R -e 'devtools::install_github("guokai8/microbial")'


# R -e '(if (!"remotes" %in% installed.packages()[,"Package"]) install.packages("remotes"))'
# R -e '(Sys.setenv(R_REMOTES_STANDALONE = "true"))'

# R -e '(if (!"devtools" %in% installed.packages()[,"Package"]) install.packages("devtools"))'
