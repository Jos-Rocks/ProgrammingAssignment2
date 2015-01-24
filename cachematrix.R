## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Tried to make naming a bit more intuitive, so I have renamed 'x' to 'storedMatrix'

makeCacheMatrix <- function(storedMatrix = matrix()) {
  storedInverse <- NULL
  getMatrix <- function() {
    storedMatrix
  }
  setMatrix <- function(newMatrix) {
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

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
