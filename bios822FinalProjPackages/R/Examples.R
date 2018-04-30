#' Say hello to object x
#'
#' @param x any printable object
#' @return printed string 'hello' and \code{x}
#' @examples
#' f("example")
#' @export
#' export is a oxgen comment to make export available for user
f <- function(x){
    print(paste("hello", x))
}

#' Say goodbye to object x
#'
#' @param x any printable object
#' @export
g <- function(x){
    print(paste("goodbye", x))
}
