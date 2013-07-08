\name{RatioSet-class}
\Rdversion{1.1}
\docType{class}
\alias{RatioSet-class}
\alias{RatioSet}
%%methods
\alias{getBeta,RatioSet-method}
\alias{getM,RatioSet-method}
\alias{getCN,RatioSet-method}
\alias{preprocessMethod,RatioSet-method}
\alias{getLocations,RatioSet-method}
\alias{show,RatioSet-method}
\alias{initialize,RatioSet-method}

\title{RatioSet instances}

\description{
  This class holds preprocessed data for Illumina methylation
  microarrays.
}

\usage{
## Constructor

RatioSet(Beta = NULL, M = NULL, CN = NULL,  ...)

## Data extraction / Accessors

\S4method{getBeta}{RatioSet}(object)
\S4method{getM}{RatioSet}(object)
\S4method{getCN}{RatioSet}(object)
\S4method{preprocessMethod}{RatioSet}(object)

## Utilities
\S4method{getLocations}{RatioSet}(object, genomeBuild = "hg19", drop = TRUE, mergeManifest = FALSE)
}

\arguments{
  \item{object}{A \code{RatioSet}.}
  \item{Beta}{A matrix of beta values (between zero and one)
    with each row being a methylation loci and each column a sample.}
  \item{M}{A matrix of log-ratios (between minus infinity and infinity)
    with each row being a methylation loci and each column a sample.}
  \item{CN}{An optional matrix of copy number estimates
    with each row being a methylation loci and each column a sample.}
  \item{genomeBuild}{Which genome build to use.}
  \item{drop}{Should unmapped loci be dropped?}
  \item{mergeManifest}{Should the information in the associated manifest
    package be merged in (added as \code{elementMetadata} to the output \code{GRanges}).}
  \item{...}{For the constructor: additional objects passes to the
    \code{eSet} constructor, particular a \code{phenoData} slot.  For
    \code{getM} these values gets passed onto \code{getBeta}.}
  
}

\details{
  This class inherits from \code{eSet}.  Essentially the class
  is a representation of a \code{Beta} matrix and/or a \code{M} matrix
  and optionally a \code{CN} (copy number) matrix linked to a
  \code{pData} data frame.

  In addition, an annotation and a preprocessMethod slot is present.  The annotation slot describes
  the type of array and also which annotation package to use.  The preprocessMethod slot describes
  the kind of preprocessing that resulted in this dataset.

  For a \code{RatioSet}, M-values are defined as \code{logit2} of the
  Beta-values if the M-values are not present in the object.  Similarly,
  if only M-values are present in the object, Beta-values are
  \code{ilogit2} of the M-values.
}

\section{Constructor}{
Instances are constructed using the \code{RatioSet} function with the
arguments outlined above.
}

\section{Accessors}{
  In the following code, \code{object} is a \code{RatioSet}.

  \describe{
    \item{\code{getBeta(object)}, \code{getM(object)}, \code{CN(object)}}{Get the
      Beta, M or CN matrix.}
    \item{\code{getManifest(object)}}{get the manifest associated with
      the object.}
    \item{\code{preprocessMethod(object)}}{Get the preprocess method \code{character}.}
      }
}

\section{Utilities}{
  In the following code, \code{object} is a \code{RatioSet}.
  
  \describe{
    \item{\code{getLocations(object)}}{This function obtains the genomic locations based on an
      annotation package.  There is the option of merging in data from the manifest package in the
      resulting \code{GRanges}.  Finally, the result is ordered according to the order of loci in the
      \code{RatioSet}, unless \code{drop=TRUE} where the number of locations is less than or equal to
      the number of loci.  Unmapped locations have a \code{seqname} of \code{unmapped}.}
  }
}

\author{Kasper Daniel Hansen \email{khansen@jhsph.edu}}

\seealso{
  \code{\linkS4class{eSet}} for the basic class structure.
  Objects of this class are typically created from an
  \code{\link{MethylSet}} using \code{\link{ratioConvert}}.
}

\examples{
  showClass("RatioSet")
}
