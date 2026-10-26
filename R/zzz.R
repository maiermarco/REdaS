my_format_pval <- function(p, digits){
  gsub("^0\\.", "\\.", format.pval(pv = round(p, digits), digits = digits, scientific = 7L))
}

pure_all_equal <- function(tgt, cur){
  isTRUE(all.equal.numeric(target = tgt, current = cur, check.attributes = FALSE))
}
