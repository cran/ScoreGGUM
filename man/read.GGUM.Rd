\name{read.GGUM}
\alias{read.GGUM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read GGUM2004 Item Parameter Output Files
}
\description{
The read.GGUM function reads an item parameter output file from a previous GGUM2004 calibration. The user must specify the number of items, the number of categories for each item, and the model number used in the GGUM2004 calibration. The model numbers correspond with the model numbers listed in the GGUM2004 User's Guide (Roberts, Shim, & Cui, 2008):
\enumerate{
    \item Constant unit version of the generalized graded unfolding model (GGUM)
    \item Multiple unit version of the GGUM
    \item Rating scale version of the GGUM
    \item Partial credit version of the GGUM
    \item Generalized constant unit version of the GGUM
    \item Generalized multiple unit version of the GGUM
    \item Generalized rating scale version of the GGUM
    \item Generalized graded unfolding model (GGUM)
    }
}
\usage{
read.GGUM(file, numItems, numCats, model = 8)
}
\arguments{
  \item{file}{a character vector of length one indicating the name of the GGUM2004 item parameter output file (e.g., "ex1_pars.txt")
}
  \item{numItems}{a numeric vector of length one indicating the number of items in the GGUM2004 calibration (e.g., 23)
}
  \item{numCats}{a numeric vector indicating the number of response categories for each item. The vector may either be of length one if the number of response categories is constant across items (e.g., 4) or of a length equal to the number of items (e.g., c(4,3,3,...,4))
}
  \item{model}{ a numeric vector of length one indicating the unfolding model estimated in the previous GGUM2004 calibration (e.g., 8)
}
}
\details{
This function reads a single GGUM2004 item parameter output file into an \emph{I}x(\emph{C}+3) numeric matrix, where \emph{I} denotes the number of items and \emph{C} denotes the maximum number of response categories across items. Regardless of the unfolding model estimated in the GGUM2004 calibration, the parameters will be converted to a standard format, with item numbers in the first column and item parameter estimates in columns 2 to \emph{C}+3. Item parameter estimates must be specified in the following order: \eqn{\delta}, \eqn{\alpha}, \eqn{{\tau}_0}, \eqn{{\tau}_1}, ..., and \eqn{{\tau}_k}, where \eqn{{\tau}_k} denotes the location of the highest response category threshold. For models 1, 2, 5, and 6, the \eqn{\lambda} parameter is converted to response category thresholds.
}
\value{
Returns a numeric matrix of item parameter estimates with one row for each item and one column for each parameter type. 
}
\references{
Roberts, J. S., Shim, H. S., & Cui, W. (2008). \emph{GGUM2004 Windows User's Guide}.
}
\examples{
# File path to GGUM2004 item parameter output file 
ex1.pars <- system.file("extdata", "ex1_pars.txt", package="ScoreGGUM")
# Specify number of response categories per item
numCats.1 <- c(rep(4,3),3,rep(4,19)) 
# Read GGUM2004 item parameter output file into R
itemPars.1 <- read.GGUM(ex1.pars, 23, numCats.1, model=8)
}