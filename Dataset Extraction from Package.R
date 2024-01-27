

# Dataset Extraction from R Package
###########################################################

# Loading Library
library(drc)

# assigning library name to mlibrary
mlibrary <- "drc"
###########################################################

# Get the data information from the package
data_info <- data(package = mlibrary)


df <- data.frame(
  Package= data_info$results[,'Package'],
  dataset_names=data_info$results[, "Item"],
  description=data_info$results[, "Title"]
  )
###########################################################

# Loop through each dataset name and load it into RStudio
n <- nrow(df)
for (i in 1:n) {
  mname <- df$dataset_names[i]
  mdesc <- df$description[i]

  # Load the dataset into RStudio without description of the dataset
  assign(mname, get(mname))
  
  # if you want to add the description also, you can keep this code
  assign(mname,cbind(get(mname),mdesc))
}

###########################################################

