# emf - excellent work! Great answers and annotations.

# Directions:

# This file contains homework questions for the lecture on working with files
# and data exploration. Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. Write out the file extension and explain what it means for the following
#    files: [comprehension]
#
#       a. `myscript.py`
#         py files are python files, so 'myscript.py' is a python file.
#
#       b. `/home/arthur/images/selfie.jpg`
#         selfie.jpg is a selfie image that is saved in the images directory,
#         which is in the arthur directory, which is in the home directory.
#
#       c. `~/Documents/data.csv`
#           data.csv is a csv file in the documents directory, which is in the
#           user's home directory. '~/' represents the user's home directory.
            # emf - could explain a bit more what a .csv file is

# 2. Which command line utility can be used to determine the type of a file? 
# [code completion]
# You can use the 'file' command to determine the type of the file. You type
# 'file [file name]' to get the file type.

# 3. Why is it a bad idea to explicitly call the `setwd` function within an R
#    script? [comprehension]
# It is bad to call the setwd function when you are working with other people.
# If you change the directory within your code, someone else will not be able 
# to run your code if they do not have the same directory on their own computer.


# 4. List one advantage and one disadvantage for each of these formats:
# [comprehension]
#   
#     a. RDS files
#         An advantage of RDS files is that it takes up much less disc space
#         than a CSV file. However, an RDS file is only meant to be read with R,
#         so it is hard to use it outside of R.
#
#     b. CSV files
#         An advantage of CSV files is that they are easy to read and can be
#         used with multiple programs. A con is that CSV files can only really
#         hold simple data, and can't hold complex information such as images.


# 5. Why doesn't R automatically load every installed package when it starts?
# [comprehension]
# R doesn't load every installed package because it would require a lot of
# memory. The user might not need to use every single package for their tasks,
# so it is better for the user to load the packages they need. 

# 6. Load the dogs data from the `dogs.rds` file provided in lecture.
#
# set directory to best_in_show so that I can access dogs.rds
setwd('/Users/haset/sts115_jozomaro/files_in_r/best_in_show')
dogs <- readRDS('dogs.rds') # read dogs.rds

#     a. How many missing values are in the `height` column? 
#       [code completion + comprehension]
#
# returns number of rows that are NA (missing) in the height column.
# dogs[is.na(dogs$height), ] returns the rows with NA in the height column, and
# nrow returns the number of rows.
nrow(dogs[is.na(dogs$height), ])
#
#     b. Think of a strategy to check the number of missing values in every
#        column using no more than 3 lines of code. Hint: think about last
#        week's lecture. Explain your strategy in words. 
#       [code completion + comprehension]
for(i in 1:ncol(dogs)) { # for all columns of dogs
  # print the number of missing values per each column by indexing dogs[,i]
  print(sum(is.na(dogs[,i]))) 
}
#
#     c. Which column has the most missing values? Try to solve this by
#        implementing your strategy from part b. If that doesn't work, you can
#        use the `summary` function to get the number of missing values in each
#        column as well as a lot of other information (we'll discuss this
#        function more next week).
#       [code completion + comprehension]
maxNA <- 1; #maxNA stores 1 for column 1
for(i in 2:ncol(dogs)) { # for all columns of dogs, except the first column
  # check if the current column i has more NA values than our maxNA column
  if(sum(is.na(dogs[,i])) > sum(is.na(dogs[,maxNA]))) {
    maxNA <- i; # if i has more NA values than maxNA, make maxNA equal to i
  }
}
print(paste("Column ", maxNA, " has the most missing values.")) # print maxNA
# emf - good - would also be helpful to know the name of col 17

# 7. Use indexing to get the subset of the dogs data which only contains large
#    dogs that are good with kids (the category `high` in the `kids` column
#    means good with kids). [code completion + comprehension]
#
# every row in dogs where size = large and kids = high, and neither is NA
# !is.na(dogs$columnName) makes sure we don't get NA values
dogs[dogs$size == 'large' & !is.na(dogs$size) & dogs$kids == 'high' & !is.na(dogs$kids), ]

# 8. With the dogs data:
#
#     a. Write the condition to test which dogs need daily grooming (the result
#        should be a logical vector). Does it contain missing values? 
#       [code completion + comprehension]
#
# logical vector that is true when the grooming column is 'daily'
myVector <- (dogs$grooming == 'daily') 
print(myVector)
# The vector contains missing values because they are NA, not TRUE or FALSE.

#     b. Use the condition from part a to get the subset of all rows containing
#        dogs that need daily grooming. How many rows are there?
#       [code completion + comprehension]
#
# Use myVector, which holds TRUE values for all daily grooming dogs after
# going through the conditional statement in part a. dogs[myVector, ] returns
# the subset of all rows in dogs were myVector is TRUE or NA
mySubset <- dogs[myVector,] 
nrow(mySubset) # get number of rows in the subset of rows
# There are 83 rows in the subset of rows.

#     c. Use the `table` function to compute the number of dogs in each
#        grooming category. You should see a different count than in part b for
#        daily grooming. What do you think is the reason for this difference?
#       [code completion + interpretation]
#
table(dogs$grooming) # get the count of dogs in each grooming category
# Table returns a count of 23 daily grooming dogs
# My count for dogs in the grooming category was greater in part b because the
# count included dogs that had a missing grooming value. The table function
# ignores missing values and only counts dogs that have 'dialy' as the grooming
# value.
#
#     d. Enclose the condition from part a in a call to the `which` function,
#        and then use it to get the subset of all rows containing dogs that
#        need daily grooming. Now how many rows are there? Does the number of
#        rows agree with the count in part c?
#       [code completion + comprehension]
#
which(dogs$grooming == 'daily') # gets rows where grooming is 'daily'
# use rows from before to index dogs and get a subset
mySubset2 <- dogs[which(dogs$grooming == 'daily'),] 
nrow(mySubset2) # number of rows in subset
# There are 23 rows. The number of rows agrees with the count from part c
# because which() also ignores NA values

# 9. Compute a table that shows the number of dogs in each grooming category
#    versus size. Does it seem like size is related to how often dogs need to
#    be groomed? Explain your reasoning. [code completion + interpretation]
#
table(dogs$grooming, dogs$size) # table of dogs' grooming category vs size
# It does not seem like size is related to how often dogs need to be groomed.
# This is because there is no strong difference in the number of dogs of each
# size in each grooming category. There are similar number of dogs in each 
# grooming category regardless of size.

# 10. Compute the number of dogs in the `terrier` group in two different ways:
#
#     a. By making a table from the `group` column. 
#       [code completion + comprehension]
#
table(dogs$group) # number of dogs per each group value
# 28 terriers
#
#     b. By getting a subset of only terriers and counting the rows.
#       [code completion + comprehension]
#
# subset of dogs when the group equals 'terrier'
mySubset3 <- dogs[which(dogs$group == 'terrier'),]
nrow(mySubset3) # number of rows in the subset
# 28 terriers
#
#     c. Computing the table is simpler (in terms of code) and provides more
#        information. In spite of that, when would indexing (approach b) be more
#        useful? [comprehension + interpretation]
#
# Indexing would be more useful if we want to actually work with the data of
# rows that have a specific column value. The table function simply gives us a
# count of the number of rows that have certain column values, however, it does
# not allow us to access the specific values in those rows. If we want to modify
# the data or extract elements from it, we would prefer to use indexing.

