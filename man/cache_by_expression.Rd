% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-cache.R
\name{cache_by_expression}
\alias{cache_by_expression}
\title{Cache text}
\usage{
cache_by_expression(text, transformers, more_specs)
}
\arguments{
\item{text}{A character vector with one or more expressions.}

\item{transformers}{A list of transformer functions, because we can only
know if text is already correct if we know which transformer function it
should be styled with.}

\item{more_specs}{A named vector coercible to character that determines the
styling but are style guide independent, such as \code{include_roxygen_examples}
or \code{base_indention}.}
}
\description{
Splits \code{text} into expressions and adds these to the cache. Note that
top-level comments are \strong{not} cached because caching and in particular
checking  if they are cached is too expensive. Comments may be cached as part
of the whole text (as opposed to on an expression by expression basis) using
\code{cache_write()} directly. Also, we must not cache stylerignore sequence,
because we might see the same expression that does not comply with the style
guide outside a stylerignore sequence and wrongly think we should leave it as
is.
}
\keyword{internal}
