# emf - good job! you can find comments below by searching for "emf"

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


# 1. All of the questions in this homework use the Best in Show data set. 
#      The data is the file `dogs.rds`.
#   a. Load the data set and use R functions to inspect the number of 
#      columns, number of rows, names of columns, and column data types.
#      [code completion + comprehension]

dogs <- readRDS("dogs.rds") # load data
dim(dogs) # get number of rows and columns
colnames(dogs) # get column names
sapply(dogs, class) # get column data types

#   b. Make a scatter plot that shows the relationship between height and
#      weight. In 2-3 sentences, discuss any patterns you see in the plot.
#      [code completion + comprehension + interpretation]

library("ggplot2") # load ggplot2
# plot height vs weight plot with transparency .3
ggplot(dogs) + aes(x = height, y = weight) + geom_point(alpha = .3)
# I notice that the taller dogs tend to be heavier because the graph shows
# higher weights for larger height values.

#   c. Set the color of the points in the scatter plot from part b to a single 
#      color of your choosing. (Tip: Choose a color from one of the sites 
#      shared in the lesson (e.g. https://coolors.co/palettes/trending))
#      [code completion + comprehension]

# plot height vs weight plot with transparency .3 and color #606c38
ggplot(dogs) + aes(x = height, y = weight) + geom_point(alpha = .3, color = '#606c38')

# 2.
#   a. Make a bar plot that shows the number of dogs in each "group" of dogs.
#      [code completion + comprehension]

# plot bar graph for dog groups
ggplot(dogs) + aes(x = group) + geom_bar()

#   b. Are any groups much larger or smaller than the others? Describe what your 
#       visualization shows.
#      [interpretation]

# The non-sporting and toy groups are a bit smaller than the other groups, 
# however, there is not a huge difference in the sizes of the groups.

#   c. Fill in the bars based on the size of the dog, and set the position 
#       argument of the bar geometry to the one you think best communicates the 
#       data. Explain why you chose this position.
#      [code completion + comprehension + interpretation]

# plot bar graph for dog counts and fill the bars based on dog size
ggplot(dogs) + aes(x = group) + geom_bar(mapping = aes(fill = size), position = "stack")
# I think stack is the best position because it shows us the difference in amount
# of dogs per size for each of the groups. Unlike dodge, however, this position
# still clearly shows the count of each dog group and makes it easier to see which
# group has the most dogs. This is assuming that we don't really care about the
# actual count of each dog size per group, but rather the distribution of the
# sizes for each group's total count

# emf - good!

# 3.
#   a. Which geometry function makes a histogram? Use the ggplot2 website or
#      cheat sheet to find out.
#      [code completion + comprehension]

# histogram of prices
ggplot(dogs) + aes(x=price) + geom_histogram()
# The geom_histogram() function will plot a histogram for the x value in the
# aes() function. Above is a simple example

#   b. Make a histogram of longevity for the dogs data. How long do most dogs
#      typically live? Explain in 1-2 sentences.
#      [code completion + comprehension + interpretation]

# histogram of longevity
ggplot(dogs) + aes(x=longevity) + geom_histogram()
# It seems that most dogs live around 12.5 years because the histogram's
# count seems to peak the highest at around the 12.5 years x value.

#   c. Inside the geometry function for histograms, play around with the bins
#      argument. (e.g. bins = 10, bins = 50). What do you think this is doing?
#      [code completion + comprehension]

# histogram of longevity with 50 bars
ggplot(dogs) + aes(x=longevity) + geom_histogram(bins = 50)
# The bins argument is changing the number of bars in the histogram. When
# bins = integer x, the plot will have x bars.
# emf - good but need to elaborate

# 4.
#   a. Modify your plot from Question 1 so that the shape of the points is
#      determined by the "group" of the dog. [code completion + comprehension]

# height vs weight scatter plot that sets shape based on the group and manually sets the shape for each group
ggplot(dogs) + aes(x = height, y = weight, shape = group) + geom_point(color = '#606c38') + scale_shape_manual(values = c(0,1,2,3,4,5,6))

#   b. Do height and weight effectively separate the different groups of dogs?
#      In other words, are there clear boundaries between the groups in the
#      plot (as opposed to being mixed together)? Are some groups better
#      separated than others?
#      [interpretation]

# The height and weight do not effectively separate the groups because there is a lot of
# overlap between the dog groups and their height and weights. The scatter plot has a lot of
# overlapping shapes throughout. The working group seems to be a bit taller and heavier than the rest
# because they tend to be the only ones on the larger end of the scatter plot. 

#   c. How might you improve the readability of this graph in order to visualize
#      this potential relationship more clearly?
#      [interpretation]

# I would improve the readability of this graph by changing the color and size of the points so it is
# easier to differentiate them and possibly make some relationships clearer to visualize. The points
# in the current graph seem to blend together and make it hard to decipher which one corresponds to
# which group.

# 5. In a paragraph, answer the following questions for the “Best in Show” 
#    visualization (https://informationisbeautiful.net/visualizations/best-in-show-whats-the-top-data-dog/) 
#    that was built using the dogs dataset.
#    a. Who do you think is the intended audience for this data visualization? 
#        How do you think that could influence data collection, metrics calculations, 
#        and graphics choices?
#       [interpretation]

# I believe that the intended audience for this data visualization was people who
# might want to know which dog breeds are the "best" according to various metrics.
# This is because the graph has separate quadrants for high and low scoring popular dogs, 
# and for high and low scoring non-popular dogs as well. This might be helpful for
# someone deciding which dog breed to buy. This means that various different information
# about the dogs has to be collected and shown in order for the audience to make their
# decision. There are ways to differentiate the size, intelligence, group, popularity, 
# and score of each dog in this graph. There is also a need to use the intelligence,
# costs, longevity, grooming, ailments, and appetite values to calculate a score for
# the dogs in the chart. The graphic must also have ways to clearly tell apart the dogs,
# such as different colors, shapes, sizes, and orientations of the data points.

#    b. Who/what is included in this data visualization and who is left out? 
#        What do you think the impact of that decision could be on conclusions drawn
#        from viewers of the data visualization? 
#       [interpretation]

# The dog's rating with kids is not mentioned in the graph. This might make it
# tougher for dog buyers who have kids to make a dog choice because they likely
# place a greater importance on how well a dog is with kids when compared to dog 
# buyers who don't have kids. It is also worth noting that the graph does not 
# show the specific values of the categories to compute the data score. This also
# leaves out people who place a greater importance on individual categories over
# others since the graph does not make it clear how each dog obtained their data 
# score. These buyers might not be able to draw a confident choice of dog based
# on this graph alone. The graph also leaves out people with color blindness by
# using color as the only way to find out what group each dog belongs to.

#    c. What could the potential impact of this visualization be on those 
#       who are left-out? [interpretation]

# Dog buyers who place great importance on specific traits, such as rating with
# kids, longevity, or costs might end up choosing a dog that they are not happy
# with based on the graph. For example, a buyer might care a lot about the
# longevity of the dog and might be wealthy enough to not worry much about the
# costs. However, a dog on the graph with a great longevity might have gotten a
# low score due to having high costs, and the buyer would end up ignoring it
# even though it would be a great fit for them. People with color blindness might
# also end up choosing wrong dogs due to struggling with differentiating the groups'
# colors.

# 6. Select your favorite data visualization from https://viz.wtf/ 
# (that was not featured during class or in the reader). 
#   a. Type the direct url to the viz you selected here:

# https://twitter.com/advertisedtwit/status/1473354400294965258

# emf - unfortunately, this links to a post that has been deleted but I will take you word for 6b-d

#   b. Describe in a few sentences the "data story" you think that this visualization 
#       is trying to tell.

# This visualization is trying to show that Mike Glennon has earned a lot of money
# for each win in his NFL career. The graph does this by showing us how much was
# earned for each of Glennon's six wins. The graph also seems to tell us that
# Glennon had only won six times in his career at that point, with each  win on
# a different team.

#   c. In a paragraph, what makes this a "bad" visualization? Evaluate the visualization 
#       based on the visualization principles and perception rules discussed in class 
#       (i.e., Gestalt principles, plot type, accessibility, critical reading, etc.), 
#       and suggest a few changes to improve the graphic.

# According to the Gestalt principles, the focal point is important in a graphical
# representation. In this graph, however, the image of Glennon with a long neck is
# much more visually captivating than the data itself, and takes away from the focal
# point. Instead of being impressed by the high earnings of Glennon, most viewers
# would be much more intrigued by the humorous image in the background. Another issue
# is that the bars in the graph are not proportional to the amount earned per each
# game. The bar for the $3,946,782 game is larger than the one for $5,000,000 bar
# even though the actual value is lower. Even the largest bar is not proportionally
# large enough to truly demonstrate how much higher it is in value than the others.
# At $18,500,000, it is $13,500,000 more than the next highest but is not even 
# twice the size. This makes it hard to read the graph and understand what it is
# attempting to demonstrate. 

#   d. Describe in 1-2 sentences one thing that this visualization actually already does well.

# One thing that this visualization does well is add different colors and team
# logos for each of the six bars. This makes it clear to separate each win and
# be able to tell with which team the win occurred. 

# 7. Look at the plot posted with this assignment on Canvas.
#    a. Identify the marks and channels in this plot. Write them out for this answer

# The marks in this plot are (0d) points. 
# The channels include:
# - The horizontal and vertical position of the points. The horizontal 
#   representing longevity, and the vertical representing lifetime cost.
# - The colors of the points. One color corresponding to each dog group.
# - The shape of the points. One shape corresponding to each dog group.

#    b. Write the code to generate this plot. (Hint: start with identifying the 
#        variables on each axis, then think about the types of channels).

# plot longevity vs lifetime_cost scatter plot. Have color and shape
# depend by group, but don't manually assign the shapes. Add title and
# x axis labels as well.
ggplot(dogs) + 
  aes(x = longevity, y = lifetime_cost, color = group, shape = group) + 
  geom_point() + 
  labs(title = "Dogs", x = "Longevity (years)")

#    c. Propose 4 improvements to the plot based on best practices.

# Some improvements I would make would be:
# 1. Rename the y axis label because it simply uses the column name while the
#    x axis actually has a name that includes the unit of measurement.
# 2. Rename the title to something other than "Dogs." The title should be
#    more informative about what the graph is trying to show.
# 3. Add a shape to the working dog group plot points. The current graph
#    only has points for the first six points because the shapes were not set
#    manually.
# 4. Add a light theme in the background so that it is easier to see
#    the shape of the points.

#    d. Modify the code to implement at least two of those changes.

# plot the longevity vs lifetime cost graph implementing the 4 changes
# also capitalized the "Group" label to make the graph neat
ggplot(dogs) + 
  aes(x = longevity, y = lifetime_cost, color = group, shape = group) + 
  geom_point() + 
  labs(title = "Dog Groups' Lifetime Cost by their Longevity", x = "Longevity (years)", y = "Lifetime Cost ($)", shape = "Group",color = "Group") +
  scale_shape_manual(values = c(16,17,15,3,7,8,18)) +
  theme_light()

# emf - great!

