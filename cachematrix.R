## gets my assignment in on time 
makeCacheMatrix <- function(blue.matrix = matrix()) {
  # sets x as an empty matrix
  red.matrix <- NULL
  # Set the inverse equal to NULL
  
  if (!is.matrix(blue.matrix)) {
    stop("I'm sorry. I can't do that, Dave")
  }
  #mocks user if supplied with non matrix object
  set <- function(y){
    blue.matrix <<- y
    # asign x argument
    red.matrix <<- NULL
    # reset to null iteration control
  }
  get <- function() blue.matrix
  # return matrix
  
  red.shift <- function(solve) red.matrix <<- solve
  # invert
  
  get.shift <- function() red.matrix
  # get.shift returns the Inverse
  
  list(set = set, get = get, red.shift= red.shift, get.shift= get.shift)
  # creates a list of the functions
  
}

# 2: cacheSolve: 

cacheSolve <- function(blue.matrix, ...) {
  
  red.matrix <-  get.shift(blue.matrix)
  # Retrives the most recent value for the inverse
  
  if(!is.null(red.matrix)){
    message("Take the blue pill")
    return(red.matrix)
    # if value is anything but null- return previous matrix      
  }
  
  message("Ingesting the red pill")
  red.shift.request <-  get(blue.matrix)
  red.matrix <- solve(red.shift.request)
  blue.matrix$red.shift(red.matrix)
  
  red.matrix 
  message("Remember to tip your program")
  #fleecing user for money
}