test_that("List of dataset is df", {
  the_list <- geobon_list()
  expect_s3_class(the_list, "tbl_df")
})

test_that("Ebv list returns error message for now", {
  the_list <- geobon_list_ebv()
  expect_equal(class(the_list), "list")
  expect_length(the_list, 2)
})
