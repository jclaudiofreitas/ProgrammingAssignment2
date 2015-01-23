## Put comments here that give an overall description of what your
## functions do
## The first function creates an object that contains 2 matrices: the original and a null object for the cached inverse matrix
## The second function tests if there the inverse matrix is null. If so it calculates the inverse and caches it else it returns the cached value


## This function creates a list of functions to set,get,set the inverse and get the inverse of a matrix 

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) inv <<- solve
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        
		inv <- x$getinv()
        if(!is.null(inv)) {
                message("cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv

		
}
