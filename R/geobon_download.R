#' Download GEOBON EBV dataset from ID
#'
#' Downloads a specific GEOBON EBV dataset from ID.
#'
#' @param id (integer) ID of the dataset
#' @param path (string) path to folder to which to download the data
#'
#' @return
#' Function is used for its side effects
#'
#' @examples
#' geobon_download(id = 2, path = tempdir())
#'
#' @export
geobon_download = function(id = NULL, path = getwd()){
  checkmate::assert_string(path)
  checkmate::assert_integerish(id)

  for (id in id){
    record <- geobon_get(id = id)
    file_path <- record$path_name_dataset
    curl::curl_download(paste0("https://portal.geobon.org/data/upload/", file_path),
                        destfile = file.path(path, basename(file_path)))
  }
}
