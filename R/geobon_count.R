#' Get the count of GEOBON datasets
#'
#' Retrieves the total count of datasets on the GEOBON data portal.
#'
#' @return
#' Integer value, number of datasets on the GEOBON data portal.
#'
#' @examples
#' geobon_count()
#'
#' @export
geobon_count = function() {

  request <- httr::GET("https://portal.geobon.org/api/v1/datasets/count")
  if(checkmate::test_string(httr::http_type(request), "application/json")){
    if(httr::content(request)$code == 404){
      stop("http error 404")
    } else {
      parsed <- jsonlite::fromJSON(
        httr::content(request, as="text", encoding = "UTF-8"), flatten = T)
      return(as.numeric(parsed$data))
    }
  } else {
    stop("API response is not of type application/json")
  }
}
