# Directions:

# This file contains homework questions for the lecture on data forensics
# and statistics. Questions appear as comments in the file. 

# The first four questions are narrative only, meaning you can just write an
# answer and do not need to write computer code. For other questions, please 
# see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################

# 1. What is a Frequency Distribution? [comprehension]
#
# A frequency distribution is a table or graph that displays the number of
# observations for different variables that are being compared.

# 2. What is a Relative Frequency Distribution? [comprehension]
#
# The Relative Frequency Distribution is a table or graph that displays the
# percentage of all observations for different variables that are being
# compared.


# 3. What is Deviation a measure of? [comprehension]
#
# Deviation is a measure of the distance from a point to a mean.


# 4. What is Standard Deviation? [comprehension]
#
# Standard deviation is the average distance from a point to the mean on a
# distribution. A larger standard deviation means the data is more dispersed. 



# 5. Load the Craigslist data and then compute:
cl <- read.csv('cl_rentals.csv')
#
#     a. The number of rows and columns. [code completion + comprehension]

dim(cl) # gets rows and columns of cl
#     b. The names of the columns. [code completion + comprehension]

colnames(cl) # gets names of all columns of cl
#     c. A structural summary of the data. [code completion + comprehension]

str(cl) # gets structural summary of data in cl
#     d. A statistical summary of the data. [code completion + comprehension]

summary(cl) # gets statistical summary of data in cl

# 6. The goal of this exercise is to compute the number of missing values in
#    every column of the Craigslist data.
#
#    a. Write a function called `count_na` that accepts a vector as input and
#       returns the number of missing values in the vector. Confirm that your
#       function works by testing it on a few vectors. 
#       [code completion + comprehension]

count_na <- function(inVector) { # count_na accepts inVector as parameter
  return(sum(is.na(inVector))) # returns sum of na values in inVector
}
#
#    b. Test your function on the `pets` column from the Craigslist data. The
#       result should be 14. If you get an error or a different result, try
#       part a again.
#       [code completion + comprehension]

count_na(cl$pets) # call count_na on the pets column
#    c. Use an apply function to apply your function to all of the columns in
#       the Craigslist data set. Include the result in your answer.
#       [code completion + comprehension]

apply(cl, 2, count_na) # applies count_na to all columns in cl
#    d. Which columns have 0 missing values? [comprehension]
#
# The title, text, date_posted, deleted, laundry, parking, and craigslist 
# columns all have 0 missing values according to the output from part c.


# 7. What time period does this data cover? Hint: convert the `date_posted`
#    column to an appropriate data type, then use the `range` function.
#    [code completion + comprehension]

range(cl$date_posted, na.rm = TRUE) # returns earliest and latest date posted

# 8. Compute the mean price for each pets category. Based on the means, are
#    apartments that allow pets typically more expensive? Explain, being
#    careful to point out any subtleties in the result.
#    [code completion + comprehension + interpretation]

# gets the mean price for each pets value
tapply(cl$price, cl$pets, mean, na.rm=TRUE) 
# Apartments that allow pets are not more expensive. Although apartments that
# allow dogs or both cats and dogs are more expensive that those that allow no
# pets, apartments that allow cats are less expensive. The mean value of the
# average prices for apartments that accept either cats, dogs, or both is 
# 1710.593 when calculated with a calculator. This is similar to the mean price
# for apartments that accept no pets.

# 9. The `sort` function sorts the elements of a vector. For instance, try
#    running this code:
#
#    x = c(4, 5, 1)
#    sort(x)
#    
#    Another way to sort vectors is by using the `order` function. The order
#    function returns the indices for the sorted values rather than the values
#    themselves:
#
#    x = c(4, 5, 1)
#    order(x)
#
#    These can be used to sort the vector by subsetting:
#
#    x[order(x)]
#    
#    The key advantage of `order` over `sort` is that it can also be used to
#    sort one vector based on another, as long as the two vectors have the same
#    length.
#    
#    Create two vectors with the same length, and use one to sort the elements
#    of the other. Explain how it (should) work.
#    [code completion + comprehension]

age <- c(20, 79, 18, 43, 35) # vector of ages
# vector of names that correspond to the same index on the age vector
name <- c("Lebron", "Bartholomew", "Ashley", "Ben", "William")
name[order(age)] # sorts the names based on their ages

# If you have two vectors of equal lengths and values that correspond to one
# another, then you can use one to order by subsetting one vector by using the 
# index order of the other vector. For example, I was able to sort the names
# based on their ages by using name[order(age)].

# 10. Use the `order` function to sort the rows of the Craigslist data set
#     based on the `sqft` column. [code completion + comprehension]
#
#     a. Compute a data frame that contains the city, square footage, and price
#        for the 5 largest apartments. [code completion + comprehension]

# based on the order of the square footage of the apartments, get the
# city, sqft, and price values. Use tail to get the 5 largest sqft values.
tail(cl[order(cl$sqft, na.last = FALSE), c("city", "sqft", "price")], n = 5)
#
#     b. Do you think any of the 5 square footage values are outliers? Explain
#        your reasoning. [interpretation]
#
# Yes, i believe that the "SACRAMENTO" and "Roseville CA" apartments have 
# outlier sqft value. The Sacramento apartment has a sqft value that is over 10 
# times larger than the next largest. The Roseville apartment, the next largest, 
# still has a value that is much larger than the other apartments. Both 
# apartments also have prices that are much lower than the others despite being
# very large.
#     c. Do you think any of the 5 square footage values are erroneous
#        (incorrect in the data)? [interpretation]
#
# Yes, I believe that both outlier values mentioned above are likely incorrect.
# The huge sizes, yet low prices, seem unlikely when compared to the other three
# apartments.

