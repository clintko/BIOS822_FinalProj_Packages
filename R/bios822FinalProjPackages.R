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
    fdat_comp  <- flowCore::compensate(fdat_raw, mat_spill)

    # Transformation
    fdat_trans <- flowCore::transform(
        fdat_comp,
        flowCore::transformList(col_name, asinh))
    return(fdat_trans)
}

#' Preprocess a flowframe by inputting file name
#'
#' a wrapper function of preprocess_flowdata
#'
#' @param file_name (str) fcs file name
#' @return fdat_trans (flowFrame) preprocessed fcs data
#' @export
read_preprocess_flowdata <- function(file_name, col_name){
    fdat_raw   <- flowCore::read.FCS(
        file.path(datadir, file_name),
        transformation = FALSE)
    fdat_trans <- preprocess_flowdata(fdat_raw, col_name)
    return(fdat_trans)
}

