## Put comments here that give an overall description of what your
## functions do
## Tried to make naming a bit more readable, for example, I have renamed 'x' to 'storedMatrix'


## makeCacheMatrix makes a special 'matrix' that is capable of caching its inverse
makeCacheMatrix <- function(storedMatrix = matrix()) {
  storedInverse <- NULL
  getMatrix <- function() {
    storedMatrix
  }
  setMatrix <- function(newMatrix) { 
    ## If the stored matrix changes, this will change the cached inverse to NULL,
    ## so we won't accidentally use the stale inverse data
    storedInverse <<- NULL
    storedMatrix <<- newMatrix
  }
  setInverse <- function(newInverse) {
    storedInverse <<- newInverse
  }
  getInverse <- function() {
    storedInverse
  }
  list(getMatrix = getMatrix,
       setMatrix = setMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(cachingMatrix, ...) {
  ## Return a matrix that is the inverse of 'x'
  solved <- cachingMaxtrix$getInverse()
  if(!is.null(solved)) {
    message("getting cached data")
    return(solved)
  }
  data <- cachingMatrix$getMatrix()
  solved <- solve(data, ...)
  cachingMatrix$setInverse(m)
  solved
}
