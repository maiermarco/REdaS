odds_ratios <- function(x){
  
  this_call <- match.call()
  
  if(is.table(x)){
    if(!identical(dim(x), c(2L, 2L))) stop("if \"x\" is supplied as a table, it must be a 2 x 2 table (i.e., 2 variables with 2 categories each).")
    tt <- list(x)
  } else if(!is.data.frame(x) || (ncol(x) < 2L)){
    stop("\"x\" must be either a 2 x 2 table or a data.frame with at least 2 variables.")
  } else {
    tt <- combn(seq_len(ncol(x)), 2L, function(i){ table(x[, i]) }, simplify = FALSE)
    if(any(unlist(lapply(tt, function(tbl){ !identical(dim(tbl), c(2L, 2L)) })))){
      stop("all variables in the data frame \"x\" must have two categories.")
    }
  }
  
  res <- list(
    call   = this_call,
    x      = x,
    tables = tt,
    comps  = combn(colnames(x), 2L, c, simplify = FALSE)
  )
  
  no_zero_warning <- TRUE
  
  res$ORs <- lapply(tt, function(tbl){
    if(any(tbl == 0) && no_zero_warning){
      warning("one or more frequencies equal to 0 encountered. there will be no results for at least one table.", call. = FALSE, immediate. = TRUE)
      no_zero_warning <- FALSE
      return(list(or = NA_real_, lor = NA_real_, se = NA_real_, z.value = NA_real_, p.value = NA_real_))
    }
    or  <- (tbl[1L, 1L] * tbl[2L, 2L]) / (tbl[1L, 2L] * tbl[2L, 1L])
    lor <- log(or)
    se  <- sqrt(sum(1.0 / (tbl)))
    z   <- lor / se
    p   <- 2.0 * pnorm(-abs(z))
    
    list(or = or, lor = lor, se = se, z.value = z, p.value = p)
  })
  
  class(res) <- "REdaS_ORs"
  
  res

}
