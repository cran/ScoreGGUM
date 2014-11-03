\name{ScoreGGUM-package}
\alias{ScoreGGUM-package}
\alias{ScoreGGUM}
\docType{package}
\title{
Estimate GGUM Person Parameters Using Pre-Calibrated Item Parameters and Disagree-Agree Response Data
}
\description{
The ScoreGGUM package estimates person parameters and associated standard errors for the generalized graded unfolding model (GGUM; Roberts, Donoghue, & Laughlin, 2000) or one of its seven nested variants using an expected a posteriori (EAP) estimator and a posterior standard deviation (Bock & Mislevy, 1982). The user provides the binary or graded disagree-agree responses to be scored along with the item parameter estimates output file from a previous GGUM2004 (Roberts, Fang, Cui, & Wang, 2006) calibration. If the GGUM2004 output file is not available, the user may enter the item parameter estimates directly using a standard format. Program features allow for missing responses, variable numbers of response categories across items, response cutoffs that eliminate uninformative response patterns, recoding of integer responses, specification of the number of quadrature points for the prior distribution, and generation of a histogram of the EAP estimates. 
}
\references{
  \enumerate{
    \item Bock, R. D., & Mislevy, R. J. (1982). Adaptive EAP estimation of ability in a microcomputer environment. \emph{Applied Psychological Measurement, 6,} 431-444.
    \item Roberts, J. S., Donoghue, J. R., & Laughlin, J. E. (2000). A general item response theory model for unfolding unidimensional polytomous responses. \emph{Applied Psychological Measurement, 24(1),} 3-32.
    \item Roberts, J. S., Fang, H. R., Cui, W., & Wang, Y. (2006). GGUM2004: A Windows-based program to estimate parameters in the generalized graded unfolding model. \emph{Applied Psychological Measurement.}
}
}