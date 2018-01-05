##  R Programming Assignment 5 Jan 2018
##  This function is able to cache potentially time-consuming computations.

##  As Per Assignement Requirements
## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

    ## initialise inverse (m)  variables
    m <- NULL

    ## create a special object that stores a numeric vector and cache's its mean
    set <- function(y) {
        x <<- y
        m <<- NULL
    } ## end function

    ## checks if mean has been calculated, if yes, gets mean from cache and skips computation
    ## else calculates the mean of the data and sets the mean value in the cache via setmean
    
    get <- function() x
    setinverse <- function(inv) m <<- inv
    getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)



} ## end of function makeCacheMatrix


## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

   m <- x$getinverse()
   if(!is.null(m)){
      message("getting cached data")
      return(m)

   } ##end if

   data <- x$get()
   m <- solve(data, ...)
   x$setinverse(m)
   m
} ## end of function cacheSolve
