## This function stores some functions in the parent environment.
##

makeCacheMatrix <- function(x = matrix()) {
     i<- NULL
     set <- function(y) {
                    x <<- y
                    i <<- NULL
          }
             get <- function() x
           setinv <- function(solve) i <<- solve
          getinv <- function() i
          list(set = set, get = get,
                   setinv = setinv,
                  getinv = getinv)
}


## This function should check if the inverse of a matrix was already found
## In case it wasn't, it finds its inverse

cacheSolve <- function(x, ...) {
     i <- x$getinv()
        if(!is.null(i)) {
            message("getting cached data")
          return(i)
     }
     data <- x$get()
         i <- solve(data, ...)
          x$setinv(i)
        i
}