add2 <- function(x, y) {
 if(x < 3) { x <- 22 }
  x + y
}

above <- function(x) {
   use <- x > 10
   x[use]

}

aboveN <- function(x, n = 10) {
   use <- x > n
   x[use]

}


columnMean <- function(y) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
     means[i] <- mean(y[,i])
  }
  means
}

columnMean2 <- function(y, x =0) {
 
 nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    if(x == 0) {    
	 means[i] <- mean(y[,i])
    }
    else {
      z <- y[,i]
      a <- z[!is.na(z)]
      means[i] <- mean(a)
    }
  }
  means
}


columnMean3 <- function(y, removeNA = TRUE) {
 
 nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
	 means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

