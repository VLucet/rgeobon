#' Get specific GEOBON EBV record
#'
#' Retrives a specific GEOBON EBV record. Note that only one of the three options
#' can be specified at a time.
#'
#' @param id (integer) ID of the dataset
#' @param ebv_class (character string) The EBV class of the dataset(s)
#' @param ebv_name (character string) The EBV name of the dataset(s)
#'
#' @return
#' a \code{data.frame} with the record(s) matching the request.
#'
#' @examples
#' geobon_get(id = 50)
#' geobon_get(ebv_class = "Community composition")
#' geobon_get(ebv_name = "Habitat structure")
#'
#' @export
geobon_get = function(id=NULL, ebv_class=NULL, ebv_name=NULL){

  if(checkmate::test_count(id)){
    selector <- "id/"
    selector_name <- "id"
    value <- as.character(id)
  } else if (checkmate::test_string(ebv_class)) {
    selector <- "ebvClass/"
    selector_name <- "EBV Class"
    value <- ebv_class
  } else if (checkmate::test_string(ebv_name)) {
    selector <- "ebvName/"
    selector_name <- "EBV Name"
    value <- ebv_name
  } else {
    stop("please specify at least one of: id (integer),
         EBV Class (string) or an EBV Name (string)")
  }

  url <- gsub(paste0("https://portal.geobon.org/api/v1/datasets/", selector, value),
              pattern = " ", replacement = "%20")
  request <- httr::GET(url)

  if(checkmate::test_string(httr::http_type(request), "application/json")){
    if(httr::content(request)$code == 404){
      stop(paste0("no datasets available for ", selector_name," : ", value))
    } else {
      the_content <- httr::content(request, as="text", encoding = "UTF-8")
      parsed <- jsonlite::fromJSON(the_content, flatten = T)
      return(parsed$data)
    }
  } else {
    stop("API response is not of type application/json")
  }

}
