#' Preprocess a flowframe
#'
#' compensate the input raw flow data and transform
#' the compensated data using arcsinh transformation
#'
#' @param fdat_raw (flowFrame) raw flow data
#' @param col_name the markers name for preprocessing
#' @return fdat_trans (flowFrame) flow data after compensation & arcsinh transformation
#' @export
preprocess_flowdata <- function(fdat_raw, col_name){
    #require(flowCore)
    # spillover matrix
    mat_spill  <- fdat_raw@description$'SPILL'

    # Compensation
    fdat_comp  <- flowCore::compensate(fdat_raw, spill)

    # Transformation
    fdat_trans <- flowCore::transform(
        fdat_comp,
        flowCore::transformList(col_name, asinh))
    return(fdat_trans)
}
