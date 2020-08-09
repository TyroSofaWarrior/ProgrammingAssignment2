## I wrote this code in hope, that it would be able to found inverse matrix and save it in the cache for avoiding repeated calculations
## Mainly there aren't many differences between function for vectors/mean from the example and required results

##the first step is creating a list containing value and answer of inverse function for matrix, so later we can use it again
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set_value <-function(value) {
        x <<- value
        m <<- NULL
    }
    get_value <- function() {
        x
    }
    set_answer <- function(answer) {
        m <<- answer
    }
    get_answer <- function(){
        m
    }
    list (set_value = set_value, get_value = get_value, 
          set_answer = set_answer, get_answer = get_answer)
}


## then we should use results of caching and ask for previous requests

cacheSolve <- function(x, ...) {
    ##ask for ready answer in cache
    m <- x$get_answer()
    ##solve the task firstly and caching result
    if (is.null(m)){
        m <- solve(x$get_value())
        x$set_answer(m)
    }
    ##return inverted matrix
    m
}