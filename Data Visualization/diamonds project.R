# 1. price & carat 
set.seed(42)
ggplot(diamonds %>% sample_n (500),
       aes(carat, price)) +
    geom_point() + 
    geom_smooth ()

# 2. x & price 
set.seed(42)
ggplot(diamonds %>% sample_n (500),
       mapping = aes(x, price, col = y)) +
  geom_point() + 
  geom_smooth (method = "lm")

# 3. cut & clarity 
ggplot(diamonds, mapping = aes(cut, fill=clarity)) +
  geom_bar(position="fill") + 
  theme_minimal()

# 4. cut & color 
library(dplyr)
set.seed(42)
ggplot(diamonds %>% sample_n(500), 
       aes(cut, color, col = color)) +
  geom_count() + 
  theme_minimal ()

# 5. price & clarity  
set.seed(42)
ggplot(diamonds %>% sample_n(500), aes( price, fill = clarity )) +
  geom_histogram() + 
  theme_minimal()
