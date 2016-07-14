## These two function should compute and cache the inverse of the
## input matrix

## Create a special matrix which is a list containing a function to 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    } 
    get <- function() {
        x
    }
    setinverse <- function(inverse) {
        m <<- inverse
    }
    getinverse <- function() {
        m
    }
    list(set = set, get = get,
         setinverse = setinverse, getinverse = getinverse)
}


## The function first check if the cached inverse is empty. 
## If the inverse is already set, cacheSolve will return the inverse.
## If the inverse is empty, it will calculated the inverse of my_matrix
## and return the inverse. 

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        print("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
