context("os_statemetasearch")

test_that("returns the correct", {
  skip_on_cran()

  a <- os_statemetasearch()
  b <- os_statemetasearch(state = 'ca')

  # classes
  expect_is(a, "data.frame")
  expect_is(b, "list")
  expect_is(b$name, "character")
  expect_true(grepl("California", b$name))

  # values
  expect_equal(b$abbreviation, "ca")
})

test_that("curl options work", {
  skip_on_cran()

  expect_error(os_statemetasearch(timeout_ms = 1), "Timeout")
})

test_that("fails well", {
  skip_on_cran()

  expect_error(os_statemetasearch(4), "Not Found")
  expect_error(os_statemetasearch("adfad"), "Not Found")
})
