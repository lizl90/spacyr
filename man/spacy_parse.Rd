% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spacy_parse.R
\name{spacy_parse}
\alias{spacy_parse}
\title{Parse a text using spaCy}
\usage{
spacy_parse(x, pos = TRUE, tag = FALSE, lemma = TRUE, entity = TRUE,
  dependency = FALSE, multithread = TRUE, ...)
}
\arguments{
\item{x}{a character object, a \pkg{quanteda} corpus, or a TIF-compliant
corpus data.frame (see \url{https://github.com/ropensci/tif})}

\item{pos}{logical whether to return universal dependency POS tagset
\url{http://universaldependencies.org/u/pos/})}

\item{tag}{logical whether to return detailed part-of-speech tags, for the
  langage model \code{en}, it uses the OntoNotes 5 version of the Penn
  Treebank tag set (\url{https://spacy.io/docs/usage/pos-tagging#pos-schemes}). 
Annotation specifications for other available languages are available on the 
spaCy website (\url{https://spacy.io/api/annotation}).}

\item{lemma}{logical; inlucde lemmatized tokens in the output (lemmatization 
may not work properly for non-English models)}

\item{entity}{logical; if \code{TRUE}, report named entities}

\item{dependency}{logical; if \code{TRUE}, analyze and return dependencies}

\item{multithread}{logical; If true, the processing is parallelized using pipe 
functionality of spacy (\url{https://spacy.io/api/pipe}).}

\item{...}{not used directly}
}
\value{
a \code{data.frame} of tokenized, parsed, and annotated tokens
}
\description{
The \code{spacy_parse()} function calls spaCy to both tokenize and tag the
texts, and returns a data.table of the results. The function provides options
on the types of tagsets (\code{tagset_} options) either  \code{"google"} or
\code{"detailed"}, as well as lemmatization (\code{lemma}). It provides a
functionalities of dependency parsing and named entity recognition as an
option. If \code{"full_parse = TRUE"} is provided, the function returns the
most extensive list of the parsing results from spaCy.
}
\examples{
\donttest{
spacy_initialize()
# See Chap 5.1 of the NLTK book, http://www.nltk.org/book/ch05.html
txt <- "And now for something completely different."
spacy_parse(txt)
spacy_parse(txt, pos = TRUE, tag = TRUE)
spacy_parse(txt, dependency = TRUE)

txt2 <- c(doc1 = "The fast cat catches mice.\\\\nThe quick brown dog jumped.", 
          doc2 = "This is the second document.",
          doc3 = "This is a \\\\\\"quoted\\\\\\" text." )
spacy_parse(txt2, entity = TRUE, dependency = TRUE)
}
}
