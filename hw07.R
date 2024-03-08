# code copied from the course reader. Only really had to do one change
# https://ucdavisdatalab.github.io/adventures_in_data_science/getting-data-from-the-web.html#web-scraping

library("xml2")
library("rvest")


parse_article_links = function(page) {
  # Get article URLs
  # The tdi_113 id changed, and now tdi_74 represents the location of the links
  div = xml_find_all(page, "//div[@id = 'tdi_74']") # CHANGE: tdi_113 to tdi_74
  links = xml_find_all(div, ".//h3/a")
  urls = xml_attr(links, "href")
  
  # Get next page URL
  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")
  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
  if (length(next_page) == 0) {
    next_url = NA
  } else {
    next_url = xml_attr(next_page, "href")
  }
  
  # Using a list allows us to return two objects
  list(urls = urls, next_url = next_url)
}


url = "https://theaggie.org/category/features/"
article_urls = list()
i = 1

# On the last page, the next URL will be `NA`.
while (!is.na(url)) {
  # Download and parse the page.
  page = read_html(url)
  result = parse_article_links(page)
  
  # Save the article URLs in the `article_urls` list. The variable `i` is the
  # page number.
  article_urls[[i]] = result$url
  i = i + 1
  
  # Set the URL to the next URL.
  url = result$next_url
  
  # Sleep for 1/30th of a second so that we never make more than 30 requests
  # per second.
  Sys.sleep(1/30)
}
