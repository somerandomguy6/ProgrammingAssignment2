## Instead of x being numeric I changed it to be a matrix
## and changed m to z and set it as NULL. I also changed all references of 
##"mean" to "solve" 

makeCacheMatrix <- function(x = matrix()) {
    z <- NULL
    set <- function(y){
      x <<- y
      z <<- NULL
    }

    get <- function() x
    setInverse <- function(solveMatrix) z <<- solveMatrix
    getInverse <- function() z
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## I did the same thing again changed "m" to "z" and "mean" to "solve"

cacheSolve <- function(x, ...) {
  z <- x$getInverse()
  if(!is.null(z)){
    message("getting cached data")
    return(z)
  }
  data <- x$get()
  z <- solve(data)
  x$setInverse(z)
  z      
        ## Return a matrix that is the inverse of 'x'
}
