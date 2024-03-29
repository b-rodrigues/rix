# WARNING - Generated by {fusen} from dev/flat_find_rev.Rmd: do not edit by hand

#' find_rev Find the right Nix revision
#' @param r_version Character. R version to look for, for example, "4.2.0". If a nixpkgs revision is provided instead, this gets returned.
#' @return A character. The Nix revision to use
#'
#' @examples
#' find_rev("4.2.0")
#' @noRd
find_rev <- function(r_version) {

  stopifnot("r_version has to be a character." = is.character(r_version))

  if(r_version == "latest"){
    return(get_latest())
  } else if(nchar(r_version) == 40){
    return(r_version)
  } else {

  temp <- new.env(parent = emptyenv())

  data(list = "r_nix_revs",
       package = "rix",
       envir = temp)

  get("r_nix_revs", envir = temp)

  output <- r_nix_revs$revision[r_nix_revs$version == r_version]

  stopifnot("Error: the provided R version is likely wrong. Please check that you provided a correct R version. You can list available versions using `available_r()`" = !identical(character(0), output))

    output
}

}

