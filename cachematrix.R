## Matrix inversion is usually a costly computation and there may be some benefit to caching
## the inverse of a matrix rather than computing it repeatedly
## 'makeCacheMatrix' makes a special 'matrix'  and sets up the functions that cacheSolve will use
## to calculate and cache the inverse.
## 'cacheSolve' returns the inverse of a special 'matrix', retrieving the cached value or
## calculating it as necessary.
## Tried to make naming a bit more readable, for example, renamed 'x' to 'storedMatrix'


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


## cacheSolve returns the inverse of the special 'matrix' returned by makeCacheMatrix.
## If the inverse has already been calculated (and the matrix has not changed since),
## then the cacheSolve should retrieve the inverse from the cache.
## If not, cacheSolve will calculate it.
cacheSolve <- function(cachingMatrix, ...) {
  solved <- cachingMatrix$getInverse()
  if(!is.null(solved)) {
    ## In this example (as we're still learning), it makes sense to see
    ## if we're getting the cached data or not, so we're printing "getting cached data"
    ## if the inverse is already cached
    message("getting cached data")
    return(solved)
  }
  data <- cachingMatrix$getMatrix()
  solved <- solve(data, ...)
  cachingMatrix$setInverse(solved)
  solved
}
