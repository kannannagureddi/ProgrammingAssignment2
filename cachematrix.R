## Function makeCacheMatrix creates a special matrix object that can cache its inverse.

## get is a function that returns the vector x stored in the main function.
## set is a function that changes the vector stored in the main function.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Function "cacheSolve" computes the inverse of the special "matrix" 
## returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(m)
  i
}
