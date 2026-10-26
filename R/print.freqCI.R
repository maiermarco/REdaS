print.freqCI <- function(x, percent = TRUE, digits, ...){
  
  if(!inherits(x, "freqCI")) stop("\"x\" must be an object of class \"freqCI\".")
  
  if(missing(digits)){
    digits <- ifelse(percent, 2L, 4L)
  } else {
    digits <- as.integer(round(digits))
  }
  
  res <- cbind(x$CIs_low, x$rel_freq, x$CIs_high)
  rownames(res) <- x$cat_names
  
  if(percent){
    ci_labelsL <- rev(round(100.0 * (0.5 - x$level / 2.0), 4L))
    ci_labelsH <- round(100.0 * (0.5 + x$level / 2.0), 4L)
    colnames(res) <- format(c(paste0(ci_labelsL, "%"), "Estimate", paste0(ci_labelsH, "%")), justify = "right")
    res <- 100.0 * res
  } else {
    ci_labelsL <- rev(round(0.5 - x$level / 2.0, 6L))
    ci_labelsH <- round(0.5 + x$level / 2.0, 6L)
    colnames(res) <- format(c(ci_labelsL, "Estimate", ci_labelsH), justify = "right")
  }
  
  print(round(res, digits))
  
  invisible(res)

}
