expandList <- function(list, number) {
  if(number == 0) {
    return(NULL)
  } else {
  if(length(list) == 1) {
    if(length(list) <= number) {
      return(c(list, rep(list, number-length(list))))
    }
    else {
      stop("You have more values")
    }
  } else {
    if(length(list) <= number) {
      return(c(list, rep("", number-length(list))))
    }
    else {
      stop("You have more values")
    }
  }
  }

}

handleValue <- function(x) {
  x_names <- unique(names(x))
  prop_len <- length(x_names)
  processed_list <- apply(matrix(as.list(x), ncol=prop_len, byrow=TRUE), 1, as.list)

  purrr::map(processed_list,setNames,x_names)
}


