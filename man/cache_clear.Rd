% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ui-caching.R
\name{cache_clear}
\alias{cache_clear}
\title{Clear the cache}
\usage{
cache_clear(cache_name = NULL, ask = TRUE)
}
\arguments{
\item{cache_name}{The name of the styler cache to use. If
\code{NULL}, the option "styler.cache_name" is considered which defaults to
the version of styler used.}

\item{ask}{Whether or not to interactively ask the user again.}
}
\description{
Clears the cache that stores which files are already styled. You won't be
able to undo this. Note that the file corresponding to the cache (a folder
on your file system) won't be deleted, but it will be empty after calling
\code{cache_clear}.
}
\details{
Each version of styler has its own cache by default, because styling is
potentially different with different versions of styler.
}
\seealso{
Other cache managers: 
\code{\link{cache_activate}()},
\code{\link{cache_info}()},
\code{\link{caching}}
}
\concept{cache managers}
