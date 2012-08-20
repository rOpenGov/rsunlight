expect_that(1 ^ 1, equals(1))
expect_that(2 ^ 2, equals(4))

expect_that(2 + 2 == 4, is_true())
expect_that(2 == 1, is_false())

expect_that(1, is_a('numeric'))

expect_that(print('Hello World!'), prints_text('Hello World!'))

expect_that(log('a'), throws_error())

expect_that(factorial(16), takes_less_than(1))

# expect_that(sqrt(2) ^ 2, is_identical_to(2))




test_that("nyt_cg_billscosponsor returns ", {
	base <- as.POSIXct("2009-08-03 12:01:59.23", tz = "UTC")
	
	is_time <- function(x) equals(as.POSIXct(x, tz = "UTC"))
	floor_base <- function(unit) floor_date(base, unit)
	
	expect_that(floor_base("second"), is_time("2009-08-03 12:01:59"))
	expect_that(floor_base("minute"), is_time("2009-08-03 12:01:00"))
	expect_that(floor_base("hour"),   is_time("2009-08-03 12:00:00"))
	expect_that(floor_base("day"),    is_time("2009-08-03 00:00:00"))
	expect_that(floor_base("week"),   is_time("2009-08-02 00:00:00"))
	expect_that(floor_base("month"),  is_time("2009-08-01 00:00:00"))
	expect_that(floor_base("year"),   is_time("2009-01-01 00:00:00"))
})