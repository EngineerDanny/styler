#' Visit'em all
#'
#' Apply a list of functions to each level in a nested parse table.
#'   `pre_visit()` applies `funs` before it preceeds to the children,
#'   (that is, starts from the outermost level of nesting progressing
#'   to the innermost level), `post_visit()` preceeds to its children
#'   before applying the functions (meaning it first applies the functions
#'   to the innermost level of nesting first and then going outwards).
#' @param pd_nested A nested parse table.
#' @inheritParams visit_one
#' @family visitors
#' @importFrom purrr map
#' @name visit
NULL

#' @rdname visit
pre_visit <- function(pd_nested, funs) {
  if (is.null(pd_nested)) return()
  pd_transformed <- visit_one(pd_nested, funs)

  pd_transformed$child <- map(pd_transformed$child, pre_visit, funs = funs)
  pd_transformed
}

#' @rdname visit
post_visit <- function(pd_nested, funs) {
  if (is.null(pd_nested)) return()
  pd_transformed <- pd_nested

  pd_transformed$child <- map(pd_transformed$child, post_visit, funs = funs)
  visit_one(pd_transformed, funs)
}

#' Transform a flat parse table with a list of transformers
#'
#' Uses [purrr::reduce()] to apply each function of `funs` sequentially to
#'   `pd_flat`.
#' @param pd_flat A flat parse table.
#' @param funs A list of transformer functions.
#' @family visitors
#' @importFrom purrr reduce
visit_one <- function(pd_flat, funs) {
  reduce(funs, function(x, fun) fun(x),
         .init = pd_flat)
}