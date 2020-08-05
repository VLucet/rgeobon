test_that("get works", {
  expect_s3_class(geobon_get(id = 1), "data.frame")
  expect_s3_class(geobon_get(ebv_class = "Community composition"), "data.frame")
  expect_s3_class(geobon_get(ebv_name = "Taxonomic diversity"), "data.frame")

  expect_error(geobon_get(id = "100", "please specify at least one of: id (integer),
         EBV Class (string) or an EBV Name (string)"))
  expect_error(geobon_get(id = 100), "no datasets available for id : 100")
  expect_error(geobon_get(ebv_class = "Taxonomic diversity"),
               "no datasets available for EBV Class : Taxonomic diversity")
  expect_error(geobon_get(ebv_name = "Community composition"),
               "no datasets available for EBV Name : Community composition")
})
