# emf - excellent work!

################################################################
# This file contains questions for the midterm exam for        #
# IST008 Adventures in Data Science:  Social Science Edition,  #
# Quarter 1.  Winter Quarter, 2022.                            #
#                                                              #
# Questions appear as comments in the file.  Some questions    #
# require you to write computer code (R or Shell Script) as    #
# an answer and other questions ask you to provide text only   #
# explanations of computing and Data Science concepts.         #
# The phrase "[Text Answer]" appears immediately following     #
# each question that requires a tex only answer.               #
#                                                              #
# This is exam is designed to provide you with the chance      #
# to demonstrate your understanding of both the concepts       #
# and syntax of the methods deployed by Data Scientists.       #
# As such, even if you are unable to provide working code      #
# for questions that require you to code, we encourage you     #
# to provide pseudo code and/or a textual explanation of       #
# of your understanding of how one would approach the          #
# problem computationally, or even how the computer itself     #
# would approach the problem given you knowledge of how        #
# computers and programming languages work.                    #
#                                                              #
# Because problem solving is an essential part of being a      #
# Data Scientist, you are allowed to use any resources at      #
# your disposal to respond to the questions in this exam.      #
# This includes, but is not limited to, resources such as      #
# Google, Stack Overflow, the Course Reader, etc.  The only    #
# restriction is that you may not use live chat, messaging,    #
# email, discourse, Slack, or any other method of real-time    #
# communication with another member of the course or any       #
# other person to formulate your response.                     #
#                                                              #
# As with the homework assignments, place your answers to      #
# each question immediately following the question prompt.     #                                            #
################################################################


# Question 1. What is the command line symbol that provides 
# a shortcut to your "home" directory on your system.  For 
# example, what symbol would you use in place of "x" in the 
# command "cd x" if you wanted to use the cd command to move 
# into your home directory:

# ~


# Question 2. Write R code to assign the value 7 to a variable "x":

x <- 7


# Question 3. Write R code that subtracts 3 from the variable "x" 
# and assigns the results to a variable "y":

y <- x - 3


# Question 4. Assign the values 1, 23, 6, 2, 19, 7 to a vector:

myVector <- c(1, 23, 6, 2, 19, 7)


# Question 5. Run the code `“four” < “five”`. Paste the output 
# from R into a comment and explain why you think it provided 
# that result: [Text Answer]

"four" < "five"

# Output: FALSE
# The output was false because R is comparing the ASCII values of "four" and 
# "five". Both words start with f, so the first letters have equal ASCII values.
# However, o has an ASCII value greater than that of i, so four has a greater
# ASCII value than five, and R returns FALSE for the equation


# Question 6. Write a for loop that loops through each element in
# the vector you created in your answer to Question 5 and prints
# each value to screen:

for(i in myVector) {
  print(i)
}


# Question 7. Assign the value 3 to a variable "x" and write
# a conditional statement that test whether x is less than 5.  
# if it is, print "Yay!" to screen:

x <- 3
if(x < 5) {
  print("Yay!")
}


# Question 8. Download the "wine_enthusiast_rankings.csv" file from
# the "data" directory in the "Files" area of the course Canvas
# website and then write code to load into a variable called "wine_revs":

wine_revs <- read.csv("wine_enthusiast_rankings.csv")


# Question 9.  Write code to determine the class of the "wine_revs"
# data object you created in Question 8 above:

class(wine_revs)


# Question 10. Write code that returns the column/variable
# names of the "wine_revs" object:

colnames(wine_revs)


# Question 11. Write code to load all observations from the
# "price" column/variable of the "wine_revs" object into
# a vector called "wine_prices":

wine_prices <- wine_revs$price


# Question 12. Subset the "wine_revs" object to create a new 
# data.frame named "wine_revs_truncated" that contains all 
# observations for only the numeric ID, Points, Price, Variety, 
# and Winery columns/variables in "wine_revs": 

wine_revs_truncated <- wine_revs[, c("X", "points", "price", "variety", "winery")]


# Question 13. Save the "wine_revs_truncated" that you created 
# in Question 12 to your local "ist008_assignments" directory 
# as an RDS file named "wine_revs_truncated.rds":

saveRDS(wine_revs_truncated, "~/sts115_jozomaro/wine_revs_truncated.rds")


# Question 14. Below is an R function that receives a single 
# argument (an integer) and returns the square root of that
# argument.  Write code (below the function) that calls the 
# function sending it the value 144 as its argument and assigns
# the returned result to a variable "z".  Note:  Be sure to run
# code of the function to load it into your environment before
# you try to call it in your answer or you won't be able to test
# your answer.

getSqrt <- function(argument_1) {
  retval <- sqrt(argument_1) 
  return(retval)
}

z <- getSqrt(144)



# Question 15. Write code that you would use to install the "fortunes"
# package onto your local machine and then load it into the working
# R environment:

install.packages("fortunes")
library("fortunes")


# Question 16. Why doesn't R automatically load every installed package when 
# it starts: [Text Answer]

# R does not load every installed every installed package because that would 
# require a lot of memory. The user likely won't be using every installed
# package, so it is better for R to let the user load the packages they need.


# Question 17. What is the git command to put a directory in your
# file system under git control (create a repository):

# git init


# Question 18. List one advantage and one disadvantage for each of the
# following data file formats: [Text Answer]
#   
#     a. RDS files
#
#       An advantage of RDS files is that they take up much less space than CSV
#       files. A disadvantage is that RDS files are specifically for R, so it
#       is hard to use RDS files outside of R.
#     b. CSV files
#
#       An advantage of CSV files is that they are easy to read and can be used
#       on different programs. A disadvantage is that CSV files can only hold
#       simple data and are unahble to hold complex data.



# Question 19. Describe the Standard Deviation of a data set in
# your own words: [Text Answer]
#
# The standard deviation is the average distance from a value to the mean for
# the values in the data. Larger standard deviations mean the data is more
# dispersed, while smaller standard deviations mean the data is close to the
# mean.



# Question 20. Discuss what statisticians mean when they talk about
# finding the "center" of a data set: [Text Answer]
#
# When statisticians talk about finding the "center" of a data set, they mean
# finding the typical value for the data set. This can be interpreted as the mean
# value (average) or the median value (middle) of the data set. 



# To submit your midterm, save this file to your local 
# "ist008_assignments" directory then stage and commit 
# this file and any other files you created as part of 
# the exam to your local repository.  Then push your
# changes to Github.
