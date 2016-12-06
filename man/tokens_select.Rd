% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tokens_select.R
\name{tokens_select}
\alias{tokens_remove}
\alias{tokens_select}
\title{select or remove tokens from a tokens object}
\usage{
tokens_select(x, features, selection = c("keep", "remove"),
  valuetype = c("glob", "regex", "fixed"), case_insensitive = TRUE,
  padding = FALSE, indexing = FALSE, verbose = FALSE)

tokens_remove(x, features, valuetype = c("glob", "regex", "fixed"),
  case_insensitive = TRUE, padding = FALSE, indexing = FALSE,
  verbose = FALSE)
}
\arguments{
\item{x}{\link{tokens} object whose token elements will be selected}

\item{features}{one of: a character vector of features to be selected, a \link{dictionary} class
object whose values (not keys) will provide the features to be selected.}

\item{selection}{whether to \code{"keep"} or \code{"remove"} the features}

\item{valuetype}{how to interpret \code{features}: \code{fixed} for words as 
is; \code{"regex"} for regular expressions; or \code{"glob"} for 
"glob"-style wildcard}

\item{case_insensitive}{ignore case when matching, if \code{TRUE}}

\item{padding}{(only for \code{tokenizedTexts} objects) if \code{TRUE}, leave
an empty string where the removed tokens previously existed.  This is
useful if a positional match is needed between the pre- and post-selected
features, for instance if a window of adjacency needs to be computed.}

\item{indexing}{use dfm-based index to efficiently process large tokens object}

\item{verbose}{if \code{TRUE} print messages about how many features were 
removed}

\item{...}{supplementary arguments passed to the underlying functions in 
\code{\link[stringi]{stri_detect_regex}}.  (This is how 
\code{case_insensitive} is passed, but you may wish to pass others.)}
}
\value{
a tokens object with features removed
}
\description{
This function selects or discards tokens from a \link{tokens} objects, with 
the shortcut \code{tokens_remove(x, features)} defined as a shortcut for
\code{tokens_select(x, features, selection = "remove")}.  The most common 
usage for \code{tokens_remove} will be to eliminate stop words from a
text or text-based object, while the most common use of \code{tokens_select} will
be to select only positive features from a list of regular 
expressions, including a dictionary.
}
\examples{
## for tokenized texts 
txt <- c(wash1 <- "Fellow citizens, I am again called upon by the voice of my country to 
                   execute the functions of its Chief Magistrate.",
         wash2 <- "When the occasion proper for it shall arrive, I shall endeavor to express
                   the high sense I entertain of this distinguished honor.")
tokens_remove(tokens(txt, removePunct = TRUE), stopwords("english"))

\dontshow{
## for tokenized texts 
txt <- c(wash1 <- "Fellow citizens, I am again called upon by the voice of my country to 
                   execute the functions of its Chief Magistrate.",
         wash2 <- "When the occasion proper for it shall arrive, I shall endeavor to express
                   the high sense I entertain of this distinguished honor.")
tokens_remove(tokenize(txt, removePunct = TRUE), stopwords("english"))

## example for collocations
(myCollocs <- collocations(data_char_inaugural[1:3], n=20))
removeFeatures(myCollocs, stopwords("english"))
removeFeatures(myCollocs, stopwords("english"), pos = 2)
}
}
