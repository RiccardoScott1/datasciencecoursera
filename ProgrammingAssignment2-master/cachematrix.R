## These two functions make it possible to set and get a given matrix and its inverse and stores them in cache

## makeCacheMatrix takes a matrix as argument and genrates a list of functions that 
## set and get ($set , $get) the matrix and its inverse  ($setinv , $getinv)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve calculates the inverse of the matrix called via the function above. 
## First it checks whether the inverse of the matrix has already been calculated. If it has, it takes the inverse from the cache
## if not it calculates it from the matrix and sets the new inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}

