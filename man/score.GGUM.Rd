\name{score.GGUM}
\alias{score.GGUM}
\title{
Score Persons Using the Generalized Graded Unfolding Model
}
\description{
The score.GGUM function estimates person parameters and associated standard errors for the generalized graded unfolding model (GGUM) or one of its seven nested variants using an expected a posteriori (EAP) estimator and a posterior standard deviation. The user provides the binary or graded disagree-agree responses to be scored along with the item parameter estimates output file from a previous GGUM2004 calibration. If the GGUM2004 output file is not available, the user may enter the item parameter estimates directly using a standard format.
}
\usage{
score.GGUM(itemPars, respData, numCats, recode=FALSE, 
            scoreMissing=TRUE, removePersons=NULL, 
            respCutoff=NULL, numQuads=30, plotTheta=TRUE,
            outFile=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{itemPars}{ An \emph{I}x(\emph{C}+3) numeric matrix, where \emph{I} denotes the number of items and \emph{C} denotes the number of response categories. The function read.GGUM can be used to read item parameter estimates from a GGUM2004 item parameter output file into the appropriate format (please refer to the section on the read.GGUM function). If a GGUM2004 output file is not available, the item parameter estimates matrix may be manually structured by placing item numbers in the first column and placing item parameter estimates in columns 2 to \emph{C}+3. Item parameter estimates must be specified in the following order: \eqn{\delta}, \eqn{\alpha}, \eqn{{\tau}_0}, \eqn{{\tau}_1}, ..., and \eqn{{\tau}_k}.
}
  \item{respData}{
A \emph{J}x(\emph{I}+1) numeric matrix, where \emph{J} denotes the number of persons and \emph{I} denotes the number of items. The first column (i.e., \emph{field} in FORTRAN terminology) must contain subject numbers and columns 2 to \emph{I}+1 must contain item responses. 
}
  \item{numCats}{
a numeric vector indicating the number of response categories for each item. The vector may either be of length one if the number of response categories is constant across items (e.g., 4) or of a length equal to the number of items if the number of response categories varies across items (e.g., c(4,3,3,...,4)). The maximum number of response categories for an item is 10.
}
  \item{recode}{
A logical vector of length one. Default value is FALSE. Use TRUE to subtract one from all responses in response data matrix. This option should be used if responses are coded from 1 to \emph{C}. (The responses must be coded from 0 to \emph{C}-1.)
}
  \item{scoreMissing}{
A logical vector of length one. Default value is TRUE, which scores persons with missing responses under the assumption that responses are missing at random. Missing responses must be coded in the response matrix using the symbol NA. Use FALSE to not score persons with missing responses. (If FALSE is used, persons with missing responses will receive NA values in place of scores.)  
}
  \item{removePersons}{
A numeric vector of length \emph{P}, where \emph{P} denotes the number of persons to be removed from the response data matrix. Each numeric value should correspond with the subject number of a person to be removed (as opposed to the row number of the person, although it is possible that the subject number and the row number are the same). For example, to remove subjects 11 and 22, use \emph{c(11,22)}.
}
  \item{respCutoff}{
A numeric vector indicating the response cutoff for each item. A response cutoff is the minimal level of agreement that a person must meet or exceed for at least one item in the analysis. If the cutoff is not met for at least one item, the person will be discarded from the analysis. The numeric vector may either be of length one if the response cutoffs are constant across items or of a length equal to the number of items if response cutoffs vary across items. Response cutoffs are specified using a scale from 0 to \eqn{\emph{C}_i}, where 0 is the strongest level of disagreement and \eqn{\emph{C}_i} is the strongest level of agreement.
}
  \item{numQuads}{
A numeric vector of length one indicating the number of quadrature points to use for the prior distribution. The default value is 30. The minimum and maximum quadrature point values are fixed at -4 and +4 respectively. The remaining qaudrature points are equally spaced between the minimum and maximum values and correspond with densities of the standard normal distribution. The number of quadrature points may be increased to improve the measurement precision of the scores, although this will also increase total runtime.
}
  \item{plotTheta}{
A logical vector of length one. Default value is TRUE, which plots the distribution of EAP estimates. Use FALSE to supress the plot.
}
  \item{outFile}{
A character vector of length one indicating the name of the output file in which the EAP estimates and associated posterior standard deviations will be saved (e.g.,"EAP_est.txt"). Subject numbers, EAP estimates, and associated posterior standard deviations are saved in a space-delimited text file in the working directory. A file name must be specified for the estimates to be saved.
}
}
\value{
Returns a \emph{J}x3 numeric matrix of person parameter estimates, where \emph{J} denotes the number of persons. Namely, each row of the matrix contains a subject number, EAP estimate, and associated posterior standard deviation.
}
\note{
\enumerate{
  \item Missing responses must be coded in the response matrix using the symbol NA. If a different symbol is used to indicate missing data, the values can be easily recoded in R. For example, to replace -9 values with NA values, use \emph{respData[which(respData[,]==-9)] <- NA}.
  \item Items may be removed from the scoring analysis by setting all responses to the item to NA (e.g., respData[,3] <- NA).
  \item The number of rows in the item parameters matrix must be equal to the number of columns minus one in the response matrix.
  \item If responses are recorded in a fixed-width text file, the read.fortran and read.fwf functions can be used to read the responses into R. If the responses are recorded in a delimited text file, the read.csv and read.table functions can be used to read in the responses.
}
}
\examples{
# File path to GGUM2004 item parameter output file 
ex1.pars <- system.file("extdata", "ex1_pars.txt", package="ScoreGGUM")
# File path to binary or graded disagree-agree responses
ex1.data <- system.file("extdata", "ex1_data.txt", package="ScoreGGUM")
# Specify number of response categories per item
numCats.1 <- c(rep(4,3),3,rep(4,19)) 
# Read GGUM2004 item parameter output file into R
itemPars.1 <- read.GGUM(ex1.pars, 23, numCats.1, model=8)
# Name output file in which EAP scores will be saved
outfile.1 <- "EAP_est1.txt"
# Load response data
respData.1 <- as.matrix(read.table(ex1.data,sep=" ",quote="",header=TRUE))
# Specify vector of persons to be removed
removePersons.1 <- c(11,22)
# Obtain EAP estimates and associated standard errors
scores.1 <- score.GGUM(itemPars.1,respData.1,numCats.1,recode=TRUE,
                        removePersons=removePersons.1,outFile=outfile.1)
}
\concept{ scoring }
\concept{ unfolding }
\concept{ item response theory }
\concept{ attitude measurement }
\concept{ personality measurement }


