## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# This function creates a special "matrix" object that can cache its inverse
## First define the argument with default mode of "matrix"
## then initialize inv as NULL
## define the set function to assign new value of matrix in parent environment

## define the get fucntion - returns value of the matrix argument
## assigns value of inv
## then gets the value of inv from where it's called

makeCacheMatrix <- function(x = matrix()) { 
        inv <- NULL
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function() x  
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

## This function computes the inverse of the special "matrix" 
## from the function above

cacheSolve <- function(x, ...){
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}




