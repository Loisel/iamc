helperBounds <- function(mx, cfg, type) {
  ref <- as.magpie(cfg[,c("variable",type)],datacol=2)
  if(type=="min") {
    check <- mx>ref
  } else if(type=="max") {
    check <- mx<ref
  } else {
    stop("Unknown type ",type)
  }
  check[is.na(check)] <- TRUE
  check <- as.quitte(check)
  failed <- check[!check$value,]
  failed <- paste(failed$variable, failed$model, failed$scenario, failed$region,sep=" | ")
  return(failed)
}