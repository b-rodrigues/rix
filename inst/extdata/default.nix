# This file was generated by the {rix} R package v0.4.1 on 2023-10-06
# with following call:
# >rix(r_ver = "7131f3c223a2d799568e4b278380cd9dac2b8579",
#  > r_pkgs = NULL,
#  > system_pkgs = NULL,
#  > git_pkgs = list(list(package_name = "rix",
#  > repo_url = "https://github.com/b-rodrigues/rix",
#  > branch_name = "master",
#  > commit = "a7b1659a5676ba34dfb68009d1993fc53431a4e3")),
#  > ide = "other",
#  > project_path = dirname(path),
#  > overwrite = TRUE,
#  > shell_hook = "R --vanilla")
# It uses nixpkgs' revision 7131f3c223a2d799568e4b278380cd9dac2b8579 for reproducibility purposes
# which will install R version latest
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7131f3c223a2d799568e4b278380cd9dac2b8579.tar.gz") {};
  git_archive_pkgs = [(pkgs.rPackages.buildRPackage {
    name = "rix";
    src = pkgs.fetchgit {
      url = "https://github.com/b-rodrigues/rix";
      branchName = "master";
      rev = "a7b1659a5676ba34dfb68009d1993fc53431a4e3";
      sha256 = "sha256-Z30dTSJW5jZjkC1I7mpAzuQthY4imc84r0V2cSp4XwM=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) httr jsonlite sys;
    };
  }) ];
  system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocalesUtf8 ;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ git_archive_pkgs   system_packages  ];
      shellHook = "R --vanilla";
  }
