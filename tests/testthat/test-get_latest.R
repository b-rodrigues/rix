# WARNING - Generated by {fusen} from dev/flat_get_latest.Rmd: do not edit by hand

testthat::test_that("get_latest() fails as expected if error", {
  is_internet_down <- function() {
    !curl::has_internet()
  }

  testthat::local_mocked_bindings(is_internet_down = function(...) TRUE)
  testthat::expect_error(get_latest())

})
