% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nix_build.R
\name{nix_build}
\alias{nix_build}
\title{Invoke shell command \code{nix-build} from an R session}
\usage{
nix_build(project_path = ".", exec_mode = c("blocking", "non-blocking"))
}
\arguments{
\item{project_path}{Path to the folder where the \code{default.nix} file resides.
The default is \code{"."}, which is the working directory in the current R
session.}

\item{exec_mode}{Either \code{"blocking"} (default) or \verb{"non-blocking}. This
will either block the R session while the \code{nix-build} shell command is
executed, or run \code{nix-build} in the background ("non-blocking").}
}
\value{
integer of the process ID (PID) of \code{nix-build} shell command
launched, if \code{nix_build()} call is assigned to an R object. Otherwise, it
will be returned invisibly.
}
\description{
Invoke shell command \code{nix-build} from an R session
}
\details{
The \code{nix-build} command line interface has more arguments. We will
probably not support all of them in this R wrapper, but currently we have
support for the following \code{nix-build} flags:
\itemize{
\item \code{--max-jobs}: Maximum number of build jobs done in parallel by Nix.
According to the official docs of Nix, it defaults to \code{1}, which is one
core. This option can be useful for shared memory multiprocessing or
systems with high I/O latency. To set \code{--max-jobs} used, you can declare
with \verb{options(rix.nix_build_max_jobs = <integer>)}. Once you call
\code{nix_build()} the flag will be propagated to the call of \code{nix-build}.
}
}
\examples{
\dontrun{
  nix_build()
}
}
