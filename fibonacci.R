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

# method 2 ----------------------------------------------------------------

# Now, as every project tends to have happen, the scope has changed.  Maybe your
# boss has had a change of heart, or perhaps the stakeholders have seen how
# great your work is and want you to write them a new version that will work to
# produce larger Fibonacci numbers.  No problem, maybe you've just learned about 
# recursion, so that should be easy! 
# https://www.freecodecamp.org/news/understanding-recursion-in-programming/

# Recursively Calculate Fibonacci Numbers
fibonacci_recursive <- function(n) {
  if (n == 1) {
    return(0)
  } else if (n == 2) {
    return(1)
  } else if (n >= 3) {
    return(fibonacci_recursive(n-1) + fibonacci_recursive(n-2))
  }
}

# let's test our function similarly to as above 
assert_that(fibonacci_recursive(1) == 0)
assert_that(fibonacci_recursive(2) == 1)

# this time we'll check that our function works to produce up to the first 
# 30 Fibonacci numbers
for (n in 3:30) {
  assert_that(fibonacci_recursive(n) == fibonacci_recursive(n-1) + fibonacci_recursive(n-2))
}
# there seems to be an issue... 

# You could commit your work so your colleagues can see it and maybe they can 
# help you out! 



# method 3 ----------------------------------------------------------------

# Finally!  After extensive research, you discover that there's an exact 
# formula for the Fibonacci sequence -- this might save the day! 
# 
# You might have even found a proof that the formula is exact: 
# https://math.stackexchange.com/a/435205/206865 
# 

fibonacci_exact <- function(n) {
  phi <- (1 + sqrt(5)) / 2 # this is the golden ratio
  fib <- (phi^(n-1) - (-1/phi)^(n-1)) / sqrt(5)
  return(fib)
} 

# let's try out our tests on this new method now! 
assert_that(fibonacci_exact(1) == 0)
assert_that(fibonacci_exact(2) == 1)

for (n in 3:50) {
  assert_that(abs(fibonacci_exact(n) - (
    fibonacci_exact(n - 1) + fibonacci_exact(n - 2)
  )) < .0001)
}


