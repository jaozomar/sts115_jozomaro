install.packages(c("tidyverse", "tokenizers", "tm", "cluster"))

manifest <- read.csv("C:/Users/haset/sts115_jozomaro/C19_novels_manifest.csv")

manifest
str(manifest)

manifest$genre <- as.factor(manifest$genre)

files <- readRDS("C:/Users/haset/sts115_jozomaro/C19_novels_raw.rds")

class(files)
head(files[[1]])

files <- lapply(files, paste, collapse = " ")

length(files[[1]])

corpus <- Corpus(VectorSource(files))
corpus[[6]]

library(stringr)