test_that("download works", {
  geobon_download(id = 1, path = tempdir())
  expect_true(file.exists(file.path(tempdir(), "cSAR_idiv_v1.nc")))
})
