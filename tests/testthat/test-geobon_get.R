test_that("get works", {
  expect_s3_class(geobon_get(id = 50), "data.frame")
  expect_s3_class(geobon_get(ebv_class = "Community composition"), "data.frame")
  expect_s3_class(geobon_get(ebv_name = "Habitat structure"), "data.frame")

  expect_error(geobon_get(id = "50", "please specify at least one of: id (integer),
         EBV Class (string) or an EBV Name (string)"))
  expect_error(geobon_get(id = 51), "no datasets available for id : 51")
  expect_error(geobon_get(ebv_class = "Habitat structure"),
               "no datasets available for EBV Class : Habitat structure")
  expect_error(geobon_get(ebv_name = "Community composition"),
               "no datasets available for EBV Name : Community composition")
})
