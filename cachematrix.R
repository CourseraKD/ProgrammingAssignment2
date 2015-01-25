#--------------------------------------------------------------------- -
# Coursera Course: R Programming
# Week 02 Programming Assignment 1: Air Pollution
# function makeCacheMatrix
# uses function complete from complete.R
#--------------------------------------------------------------------- -

## This file has two functions that implement a cached matrix, that is,
## an object that holds the original matrix and its inverse. 
## This removes the need to calculate the inverse every time it is 
## needed. 

cacheSolve <- function(x, ...) {
}

# ---- makeCacheMatrix -----------------------------------------------
## 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(minverse) inv <<- minverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)    
}

# ---- cacheSolve ----------------------------------------------------
## Set the inverse matrix of a cached matrix
cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}

