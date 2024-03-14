# Directions:

# This file contains homework questions for the lecture on data visualization.
# Questions appear as comments in the file. 

# Please see the Grading Criteria Canvas Page for specific guidance on what
# we expect from you regarding assignment responses.

# Once you have completed the assignment, follow the Submission Instructions 
# on Canvas Pages section to add, commit, and push this to your GitHub repository. 

# Some questions have multiple parts - make sure to read carefully and
# answer all of them. The majority of points lost in homework come from
# careless skipping over question parts.  

###############################################################################


# Write an R code snippet that uses regular expressions to find all occurrences of 
# dates in the string variable text that are in the format "dd/mm/yyyy" and replace 
# them with the format "yyyy-mm-dd". The text variable contains multiple dates in 
# the "dd/mm/yyyy" format interspersed with other text. For example, if text is 
# "The event was held on 23/04/2021 and the next event will be on 05/10/2022.", 
# the output should be "The event was held on 2021-04-23 and the next 
# event will be on 2022-10-05.".
#
# Ensure your code dynamically handles the text variable, meaning it should work 
# for any string input following the mentioned pattern. Use relevant functions from 
# the stringr package, any other package, or base R for your solution.

library(stringr)

sample_text <- c("The event was held on 23/04/2021 and the next event will be on 05/10/2022.")

# finds all text sections that are formatted as dd/mm/yyyy and switches the order to yyyy-mm-dd
str_replace_all(sample_text, "(0[1-9]|[1-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/(\\d{4})", "\\3-\\2-\\1")

# Write an R code snippet that assigns the string "I am here.  Am I alive" to
# a variable "x" and uses an Escape Sequence to put a newline between the two
# sentences.

# \n creates a new line between the two sentences in x
x <- "I am here.\nAm I alive" 


# Write an R code snippet that assings the following string to the variable "y:"
#
# She said, "Hi!"

# The \ symbols allow us to add quotations in the string without closing the string
y <- "She said \"Hi!\""

# [TEXT ANSWER] Explain what a Text Encoding is:

# Because computers store data as binary numbers, there are different ways of mapping
# text with numbers in order to store them on computers. The method of mapping
# text to numbers is called text encoding. Examples of common text encodings
# include ASCII and Unicode.



# Write an R code snippet that creates a vector of all containing the words in the string, 
# "He wanted to say hello but was afraid".  Then use the stringr library to locate any 
# occurences of the string "hello" in your vector.

myVector <- c("He", "Wanted", "to", "say", "hello", "but", "was", "afraid")
str_detect(myVector, "hello") # detects occurences of "hello" in myVector



# Section "15.8 Corpus Analytics" of the reader contains a tutorial on performing
# corpus analytics on a Document Term Matrix of 19th Century novels.  A Document Term
# Matrix is a matrix that contains information about the number of times that a work 
# appears in each text in a corpus.  In class, we calculated the word frequencies for
# the novel _Wuthering Heights_.  There "data" folder in the Files area of Canvas for 
# this course contains a file names dtm.rds which holds this type of count information
# for every normalized text in the collection of novels we worked with in class. 
# First, download that file to your couse working directory.   Then, recreate a working
# version of the code in section 15.8 of the reader below.  Note that before you can 
# use the code in that section you will need to read dtm.rds file into the dtm variable
# so that the data ih the DTM is available to the rest of the code.

library(tm)
dtm <- readRDS("C:/Users/haset/sts115_jozomaro/dtm.rds") # read dtm.rds
# read the 19th century novels csv file
manifest <- read.csv("C:/Users/haset/sts115_jozomaro/C19_novels_manifest.csv")

dtm$ncol # number of columns
dtm$nrow # number of rows

# change document names in the DTM to the novel titles from manifest
dtm$dimnames$Docs <- manifest$title 
dtm$dimnames$Docs # view document names

inspect(dtm) # inspect contents of the DTM

findFreqTerms(dtm, 1000) # find terms with at least 1000 occurences in dtm
# find terms associated with the word 'boat' with at least 0.85 correlation
findAssocs(dtm, "boat", .85) 
# find terms associated with the word 'writing' with at least 0.85 correlation
writing <- findAssocs(dtm, "writing", .85)
writing[[1]][1:15] # only show the top 15 results from findAssocs

