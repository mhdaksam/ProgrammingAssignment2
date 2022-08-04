## makeCachemMatrix creates a list of functions to set the value of the vector, 
## get the value of the vector, set the value of the inverse, and get the value of the inverse 
##while cascheSolve checks if the inverse is already stored and returns the value of the inverse accordingly

## It takes square matrix as an argument and cache it and its inverse in the memory and creates a list of functions

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
} 
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list("set" = set, "get" = get, "setinverse" = setinverse, "getinverse" = getinverse)
}


## It takes a square matrix as an argument and checks if its inverse is already stored in the memory
## If it is, then it returns the stored value of the inverse. If not, then it calculates the value, cache it and
## finally, return the required value

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
