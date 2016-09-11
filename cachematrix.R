## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
## Creates 4 functions
## Creates set() which set x and m in parent environment
set<-function(y) {
  x<<-y
  m<<-NULL
}
## Retrives x from parent environment
get<-function()x
## Defines m in parent environment
setsolve<-function(solve) m<<-solve
## Retrieve m from parent environment
getsolve<-function()m
## Creates list of 4 functions
list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getsolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
    
  data<-x$get()
    ## Creates m as the inverse of x
    m<-solve(data,...)
    ## Set the inverse matrix in parent environment (caches data)
    x$setsolve(m)
    m
}

makeVector <-function(x=numeric()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NUUL
  }
  get<-function()x
  setmean<-function(mean) m<<-mean
  getmean<-function()m
  list(set=set,get=get,setmean=setmean,getmean=getmean)
}

cachemean<-function(x,...){
  m<-x$getmean()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-mean(data,...)
  x$setmean(m)
  m
}