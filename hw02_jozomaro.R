my_data <- read.csv("C:/Users/haset/sts115_jozomaro/hw02_R_intro/my_data.csv")

# 1. Interview 5 people from outside of STS115 and add their data to the “my_data” data frame from class to create a new data frame called “our_data”. You will use this for the subsequent questions. (Please do not interview someone who a classmate has already interviewed. You can call, Zoom, etc. but you need to actually talk to other human beings to complete this assignment!)
new_data <- data.frame(major=c('Computer Science and Engineering', 'Data Science and Anthropology', 'Aerospace Engineering', 'Computer Science and Engineering', 'Managerial Economics'),
                       location=c('Ali Baba', 'El Burrito', 'Mishka\'s', 'Sam\'s Mediterranean', 'Guad\'s'),
                       distance.mi=c(0.6, 0.8, 0.7, 0.6, 0.6),
                       time.min=c(3, 4, 4, 3, 3),
                       pet=c('Cats rule, dogs drool', 'I prefer feathers or scales', 'Cats rule, dogs drool', 'Cats rule, dogs drool', 'Woof'))
our_data <- rbind(my_data, new_data)
# 2. Come up with a yes/no or true/false question you’d have liked the survey to have asked. Make up these data for every subject in the survey, then create it as a logical vector and add it to the data frame.   
myVector <- c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,
            TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,
            FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,
            TRUE,TRUE,FALSE,TRUE)
our_data$hasPets <- myVector
# 3. Use a single function to return the class of each column in the data frame. 
sapply(our_data, class)
# 4. Look up how to use the function `max`. Use it to calculate the longest commute distance and travel time.
maxDistance <- max(our_data$distance.mi, na.rm = TRUE)
maxTime <- max(our_data$time.min, na.rm = TRUE)
# 5. Calculate travel speed across subjects as miles per minute. Assign this to a new vector `mi.per.min` and add it to the data frame. 
mi.per.min <- our_data$distance.mi/our_data$time.min
our_data$mi.per.min <- mi.per.min
# 6. Use a function to return the total number of elements in mi.per.min.
mi.per.min.length <- length(mi.per.min)
# 7. Index/subset the vector `major` to get a new vector that contains the 3rd, 1st, and 9th elements (in that order).
majorData <- our_data[c(3,1,9), c(1)]
# 8. R’s `[` indexing operator accepts several different types of indexes, not only positive whole numbers. For example, the operator accepts negative numbers as indexes. Using the vector `places`, try out three to five different negative indexes. Based on the results, what do you think the [ operator does with negative indexes?
print(our_data[c(-1),c(2)])
print(our_data[c(-2),c(2)])
print(our_data[c(-3),c(2)])
#I notice that using a negative index will print out the entire column data, except it will skip the row of the index we put in 
#as a negative. For example, using index row -2, the output will print the entire column of places except for element 2.

# 9. Consider the R code `c(3, 3.1, “4”, -1, TRUE)`.  
#         a. WITHOUT running the code, what data type you think the result will have and why? 
#           I think the code will have character type because all the non-character values can be converted to
#           characters by adding '' around the value

#        b. Now run the code to check whether your guess was correct. If it was not correct, explain what the actual data type is and why. If your guess was correct, write a new, different line of code that yields the same resulting data type.
            class(c(3, 3.1, "4", -1, TRUE))
#           My guess was correct. A new line of code with the same type is:
            class(c("good morning", 'hello', 4.5, TRUE, FALSE))

# 10. Run the code `“four” < “five”`. Paste the output from R into a comment and explain why you think it provided that result.
"four" < "five"
#The output was FALSE. I believe this is because the ASCII value of four is greater than five. This is because the letter o has
#a higher ASCII value than the letter i (both four and five start with the letter f)
# 11. There are several major mistakes in the data entered in class.
#        a. Describe in complete sentences what at least 2 of the errors are. Make some guesses as to how those errors may have happened, and how they might affect analyses and/or re-use of these data.
#          One of the errors is that some of the distances were way too long. Specifically 427 miles to the CoHo. Despite
#          the long distance, the time value was just 1 minute. This is probably because the units were incorrectly interpreted. 
#          The CoHo might have been 427 feet away rather than 427 miles away. Another error is that some values have reasonable times,
#          however, slightly long distances. For example, Guad's is labeled as 0.6 miles on 2 inputs, but was 1.9 miles in another input.
#          This is likely because the distance by car was probably used when estimating the distance to travel rather than walking disrance.
#          When you drive to a nearby place, you usually have to drive a slightly longer distance than the distance it would take to
#          directly walk there. 
#        b. Pretend the data frame was too big for you to view it manually. List specific function calls you could use in R to help you find these mistakes programmatically.
#          I would probably use the max, min, and mean functions to find the average values and any possibly outliers. I could use the
#          sapply() and tapply() functions to apply these functions to the data frame and be able to quickly find errors or 
#          inconsistencies. 
