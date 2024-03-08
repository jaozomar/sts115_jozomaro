##########################
# Getting Data from APIs #
##########################

#scraping https://restcountries.com

# load neaded libraries
library(httr)
library(jsonlite)

# get the page
response <- GET("https://restcountries.com/v3.1/all?fields=name")

# look at the response code
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
cat(response$status_code)

# look at the response headers
response$headers

# look at the contents
response$content

# extract compressed data as text
bdy <-content(response, "text")

# look at it
class(bdy)
cat(bdy)

# load as a strctured json object
bdy_json <- fromJSON(bdy)

# look at it
class(bdy_json)
str(bdy_json)

# look at some names
bdy_json$name$common

################
# web scraping #
################

library(xml2) # package for parsing xml documents
library(rvest) # package for web scraping

# lets look at a simple html page
# https://datalab.ucdavis.edu/simple.html

doc = read_html('https://datalab.ucdavis.edu/simple.html')

# now lets load something more complicated
# https://en.wikipedia.org/wiki/List_of_cities_and_towns_in_California

# define the URL
wiki_url = "https://en.wikipedia.org/wiki/List_of_cities_and_towns_in_California"

# load the page
wiki_doc = read_html(wiki_url)

# the info we are looking for is in a table
# so let's extract the table
tables = xml_find_all(wiki_doc, "//table")

# look at it
class(tables)
str(tables)
tables


# let's get just the row headers table
tab = xml_find_all(tables, "//*[contains(@class, 'plainrowheaders')]")

# look at it
class(tab)
str(tab)
tab

# let's get everything in the cities column
cities = html_table(tab, fill = TRUE)

# look at it
class(cities)
str(cities)
cities

# extract the first element of the list
cities = cities[[1]]

# look at it
head(cities)

# we can look at sub sections
cities$`Incorporated[7]`

# lets check what kind of data is in different fields
class(cities$`Incorporated[7]`)
class(cities$`Population (2020)[9]`)

# lets load a text processing library
library(stringr)

# and let's assing better column names
names(cities) = c("city", "type", "county", "population2020", "population2010", "change", "mi2", "km2", "density", "date")

# take a look
head(cities)

# let's remove the first row
cities = cities[-1, ]

# look at it again
head(cities)

# now lets do start doing some forensics
head(cities$date)
class(cities$date)

# load lubridate library
library(lubridate)

# get a vector of dates in a numeric format
dates = mdy(cities$date)

# reassign the values
cities$date = dates

# now look at cities
class(cities$date)
head(cities$date)

# fix population
class(cities$population2020)
pop = str_replace_all(cities$population2020, ",", "")
pop = str_replace_all(pop, "\\[[0-9]+\\]", "")
pop = as.numeric(pop)
cities$population2020 = pop

# look at it
class(cities$population2020)
head(cities$population2020)


# cal aggie example

# look at website
# https://theaggie.org/category/features/

# assign url and load
url = "https://theaggie.org/category/features/"
doc = read_html(url)

# look at it
doc

# New we can extract parts of the site
xml_find_all(doc, "//div[contains(@class, 'td_block_inner')]")

# what we are about are items that are id's at tdi_74
div = xml_find_all(doc, "//div[@id = 'tdi_74']")

# now lets try getting some links
links = xml_find_all(div, ".//a")

# lets look at our links
length(links)
head(links)

# lets extract only links that are on the header text
links = xml_find_all(div, ".//h3/a")

# now lets look
length(links)
head(links)

# what kind of data type is in links
class(links)

# we need to extract the text of the link from the node object
feature_urls = xml_attr(links, "href")

# look at it
class(feature_urls)
head(feature_urls)

# could this code be reusable?  Yes, it's the same
# structure on all pages so this is usefull code 
# to put in a function

# define our function
parse_article_links = function(page) {
  htmlconts = read_html(page)
  div1 = xml_find_all(htmlconts, "//div[@id = 'tdi_74']")
  links2 = xml_find_all(div1, ".//h3/a")
  ret = xml_attr(links2, "href")
  return(ret)
}

# now, let's call our function and see if it work
links <- parse_article_links("https://theaggie.org/category/features/")
links_p2 <- parse_article_links("https://theaggie.org/category/features/page/2/")

# lets look
head(links)
head(links_p2)

# now, how would we get all of the features

# get the nav section of the website
nav = xml_find_all(doc, "//div[contains(@class, 'page-nav')]")

# now lets write a function that goes throug all the pages
# and gets all the links
parse_article_links_all = function(page) {
  
  # get the first page
  htmlconts = read_html(page)
  
  #get the page nav
  navchunk = xml_find_all(doc, "//div[contains(@class, 'page-nav')]")
  last_link = xml_find_all(navchunk, ".//a[contains(@class, 'last')]")
  last_page = as.numeric(xml_text(last_link))
  
  # create an empty vector for return
  rlinks = c()
  
  # loop through all of the pages and process
#  for (i in 1:last_page) {
  for (i in 1:5) {
    # be a polite robot
    Sys.sleep(5)
    
    # define the page url to be scraped in this iteration
    iurl = paste("https://theaggie.org/category/features/page/", i, sep="")
    
    # call our link scraping function
    ilinks = parse_article_links(iurl)
    
    #add the returned links to return vector
    rlinks <- c(rlinks, ilinks)

  }
  
  # return the scraped links
  return(rlinks)
}

# call our scraper
links_all <- parse_article_links_all("https://theaggie.org/category/features/")
