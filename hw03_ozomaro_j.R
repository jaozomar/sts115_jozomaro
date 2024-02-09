#emf - Overall you do a great job answering each question and annotating your code!

# This file contains homework questions for the lecture on 
# Control Structures and Functions.  Questions appear as comments 
# in the file.  Place your answers as executable code immediately 
# following the relevant question.


# QUESTION 1: Assign the value 3 to a variable "x" and write
# a conditional statement that test whether x is less than 5.  
# if it is, print "Yay!" to screen.

x <- 3
if (x < 5) { # checks if x is less than 5 using <
  print("Yay!")
}


# QUESTION 2:  Create two variables "x" and "y" and assign 
# each a numeric value. Create a conditional statement that 
# tests whether the value of a variable "x" is equivalent 
# to the value of variable "y." If the values are equivalent, 
# print "The variables are equal" to screen. If they are not 
# equivalent, print "The variables are not equal" to screen.

x <- 5
y <- 100
if(x == y) { # checks if x is equal to y using ==
  print("The variables are equal")
} else {
  print("The variables are not equal")
}


# QUESTION 3:  Duplicate the conditional code from above, but 
# change the logic of the conditional so that it tests for 
# conditions in which "x" IS NOT EQUIVALENT" to "y" and print 
# the appropriate message to screen accordingly.

if(x != y) { # checks if x is not equal to y using !=
  print("The variables are not equal")
} else {
  print("The variables are equal")
}


# QUESTION 4:  Assign the boolean value TRUE to the variable "x", 
# and then create a conditional statement that tests whether the 
# value of a variable "x" is TRUE or FALSE. If the value is true, 
# print "X is true" to screen. If false print "X is false" to screen.

x <- TRUE
if(x) { # checks if x is true 
  print("X is true")
} else {
  print("X is false")
}

# QUESTION 5: Write a "for" loop that iterates through the 
# values 1 to 10 and prints the iteration number to screen 
# during each loop.

for(i in 1:10) { # iterates through all values between 1 and 10
  print(i)
}


# Question 6: Assume that you want to create a loop that executes 
# exactly 10 times. Assign the value 1 to "x" and then write a "while" 
# loop that iterates based on a test of the value of "x" and for each 
# loop prints the value of "x" to the screen. 
#
# The printed output should look like:
#
# 1 2 3 4 5 6 7 8 9 10
#
# Note that depending on your browser the numbers may print to the same 
# line or each on a new line.

x <- 1
while(x <= 10) { # - loops while x is less than or equal to 10
  cat(x, ' ')    # - concatenates and prints x, followed by a space,  
                 #   so that entire output is on the same line
  x <- x+1       # - increases value of x
}


# Question 7: Create a list or vector object that contains 
# the following values:
#
# Tesla, Nissan, Harley, Chevy, Indian, MG. 
# 
# Then write code that loops through each item in the list and
# prints the value to screen

myList <- list('Tesla', 'Nissan', 'Harley', 'Chevy', 'Indian', 'MG')
for(i in myList) { # iterates through all elements in myList 
  print(i)
}


# Question 8: Write code that loops through each item in the list 
# object that you created for Question 3 above and, for each value,
# if the values is "Harley" or "Indian" print, "This is a motorcycle" 
# to screen. Otherwise print, "This is a car" to screen.

for(i in myList) { # iterates through all elements in myList 
  if(i == "Harley" || i == "Indian") { # checks if i equals "Harley" OR "Indian"
    print("This is a motorcycle")      # using || (which means "OR")
  } else {
    print("This is a car")
  }
}


# Question 9: Assign the values 1-10 to a vector.  Then, loop through
# your vector and print each value to screen unless the value is 5.  (The
# final output of your process should be: 1 2 3 4 6 7 8 9 10)

myVector = c(1:10)
for(i in myVector) { # iterates through all elements in myVector
  if(i != 5) { # checks if i is not equal to 5 using !=
    cat(i, ' ') # print all output on the same line, separated by spaces
  }
}


# QUESTION 10: Write a function that performs a simple math equation 
# with a variable. Run the function substituting the variable with 
# at least three different values by calling it in a loop. For 
# instance, if you write a function for a variable "x", Use a loop 
# call the function for at least three numbers as "x".

numSquared <- function(num) {
  return(num * num) # squares num
}

for(i in 1:3){ # changes i to values from 1 to 3 by iterating with a for loop
  print(numSquared(i)) # prints numSquared(i) for i values of 1 through 3
}
