## HW 1 web scraping in H&M
library(rvest)
library(tidyverse)

url_hm <- "https://www2.hm.com/en_us/kids/products/new-arrivals.html"

# ดึงcloth names 
clothes_name <- url_hm %>%
  read_html() %>%
  html_elements("h3.item-heading") %>%
  html_text2()

clothes_name

# ดึง clothes_price
clothes_price <- url_hm %>%
  read_html() %>%
  html_elements("strong.item-price") %>%
  html_text2()

clothes_price

# remove "\r" in clothes_name
new_clothes_name <- gsub("\r", " ", clothes_name)

new_clothes_name

# remove "\r" in clothes_price
new_clothes_price <- gsub("\r", " ", clothes_price)

new_clothes_price

# put new_clothes_name and new_clothes_price into 1 data frame
df_hm <- data.frame(new_clothes_name, new_clothes_price)
View(df_hm)
