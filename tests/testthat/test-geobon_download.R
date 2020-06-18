test_that("download works", {
  geobon_download(id = 49, path = tempdir())
  expect_true(file.exists(file.path(tempdir(), "hansen_lossyear_1000m.nc")))
})
