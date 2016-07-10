## Put comments here that give an overall description of what your functions do


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
## Return a matrix that is the inverse of 'x'
}


#######################################################################
## Caching the Inverse of a Matrix: Create a special "matrix", which is a list containing a function to
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    Minv <- NULL
    set <- function(y) {
        x <<- y
        Minv <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) Minv <<- inv
    getinverse <- function() Minv
    list( set = set, get = get, setinverse = setinverse, getinverse = getinverse )
}


## Calculate the inverse of the special "matrix" created with the above function
## reusing cached result if it is available
## solve(A, b)	Returns vector x in the equation b = Ax (i.e., A-1b)
## solve(A)	Inverse of A where A is a square matrix.

cacheSolve <- function(x, ...) {
    Minv <- x$getinverse()
    if(!is.null(Minv)) {
        message("getting cached data")
        return(Minv)
    }
    mat <- x$get()
    Minv <- solve(mat, ...)
    x$setinverse(Minv)
    Minv
}


test_Matrix <- makeCacheMatrix(matrix(c(3, 3, 3, 5), c(2, 2)))
cacheSolve(test_Matrix)



######Check the solution using traditional method

##MM<- matrix(c(3, 3, 3,5), c(2, 2))
##MM
##solve(MM)

