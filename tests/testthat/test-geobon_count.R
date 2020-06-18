test_that("count is positive integer", {
  count <- geobon_count()
  expect_true(is.numeric(count))
  expect_true(count > 0)
})
