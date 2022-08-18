# Fibonacci Numbers in R 

# method 1 ----------------------------------------------------------------

# Suppose your boss has asked you to write a function that returns the Nth 
# Fibonacci number for up to the first 20 values.

# Being the astute data scientist you are, and having done your research, 
# you may have found that the Online Encyclopedia of Integer Sequences has 
# these data and you can use those directly in your code!  

# Return the Nth Fibonacci Number up to the 20th
fibonacci <- function(n) {
  c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 
    987, 1597, 2584, 4181)[n]
}

# Moreover, since you're such an astute data scientist, you thought it made sense
# to write some tests/checks that ensure the data is correct. 
library(assertthat)

assert_that(fibonacci(1) == 0)
assert_that(fibonacci(2) == 1)

for (n in 3:20) {
  assert_that(fibonacci(n) == fibonacci(n-1) + fibonacci(n-2))
}
# looks like all the tests passed!  great! 
# At this point, you should commit your work. 
