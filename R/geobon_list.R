#' List all available GEOBON EBV datasets and EBV vaariable types on the portal
#'
#' The function \code{geobon_list} Retrieves the list of all datasets available
#' on the GEOBON data portal. Also, \code{geobon_list_ebv} returns all possible
#' values for EBV classes and names.
#'
#' @return
#' A \code{tibble} for \code{geobon_list()} and a list for \code{geobon_list_ebv()}
#'
#' @examples
#' geobon_list()
#' geobon_list_ebv()
#'
#' @export
geobon_list = function(){

  request <- httr::GET("https://portal.geobon.org/api/v1/datasets/list")
  if(checkmate::test_string(httr::http_type(request), "application/json")){
    the_content <-  httr::content(request, as="text", encoding = "UTF-8")
    parsed <- jsonlite::fromJSON(the_content, flatten = T)
    if(parsed$code == 404){
      stop("http error 404")
    } else{
      tbl_data <- janitor::clean_names(tibble::as_tibble(parsed$data))
      return(tbl_data)
    }
  } else {
    stop("API response is not of type application/json")
  }

}
#' @rdname geobon_list
#' @export
geobon_list_ebv = function() {

  the_list <- geobon_list()
  df <-  the_list[, c("ebv_ebv_class", "ebv_ebv_name")]
  names(df) <- c("ebv_class", "ebv_name")
  returned_list <- lapply(as.list(df), unique)
  return(returned_list)

}
