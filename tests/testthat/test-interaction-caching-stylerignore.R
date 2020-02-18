test_that("caching works with stylerignore for multi-token lines when partly cached before", {
  on.exit(cache_deactivate())
  fresh_testthat_cache()
  text1 <- "1 + 1"
  expect_equal(
    as.character(style_text(text1)),
    text1
  )

  text2 <- c(
    "# styler: off",
    "1 + 1",
    "# styler: on",
    "# a comment"
  )
  expect_equal(
    as.character(style_text(text2)),
    text2
  )
})

test_that("caching works with stylerignore for multi-token lines", {
  on.exit(cache_deactivate())
  fresh_testthat_cache()
  text3 <- c(
    "# styler: off",
    "1 + 1 #comment2",
    "# styler: on",
    "#a comment"
  )
  text3_correct <- c(
    "# styler: off",
    "1 + 1 #comment2",
    "# styler: on",
    "# a comment"
  )

  expect_equal(
    as.character(style_text(text3)),
    text3_correct
  )

  expect_equal(
    as.character(style_text(text3_correct)),
    text3_correct
  )

  text4 <- c(
    "# styler: off",
    "1 +1",
    "x(x)",
    "# styler: on",
    "# a comment"
  )

  expect_equal(
    as.character(style_text(text4)),
    text4
  )
})

test_that("caching works ", {
  on.exit(cache_deactivate())
  fresh_testthat_cache()
  text1 <- "1 + 1"
  expect_equal(
    as.character(style_text(text1)),
    text1
  )

  text2 <- c(
    "# styler: off",
    "1 + 1",
    "# styler: on",
    "# a comment"
  )
  expect_equal(
    as.character(style_text(text2)),
    text2
  )
})

# when a top-level expression is cached, it means it is already complying to
# the style.
# Since top-level comments are not cached, the expression in the stylerignore
# sequence will be in a different block if cached and not be senth though
# apply_stylerignore.

# if the stylerignore tag is top level
test_that("caching works for top level expressions", {
  on.exit(cache_deactivate())
  fresh_testthat_cache()
  text1 <- "1 + 1"
  expect_equal(
    as.character(style_text(text1)),
    text1
  )

  text2 <- c(
    "# styler: off",
    "1 + 1",
    "# styler: on",
    "# a comment"
  )
  expect_equal(
    as.character(style_text(text2)),
    text2
  )
})

# if the stylerignore tag is not top level
# since we only cache top-level expressions, the whole expression is either
# cached or not, depending on whether it is complying to the style guide.
test_that("caching works for non-top-level expressions", {
  on.exit(cache_deactivate())
  fresh_testthat_cache()
  text1 <- "1 + 1"
  expect_equal(
    as.character(style_text(text1)),
    text1
  )

  text2 <- c(
    "cal8(",
    "  # styler: off",
    "  1 + 1,",
    "  # styler: on",
    ")",
    "# comment"
  )
  expect_equal(
    as.character(style_text(text2)),
    text2
  )
})
