# This file was generated by the {rix} R package v0.6.0 on 2024-02-14
# with following call:
# >rix(r_ver = "2d627a2a704708673e56346fcb13d25344b8eaf3",
#  > r_pkgs = NULL,
#  > system_pkgs = NULL,
#  > git_pkgs = list(package_name = "rix",
#  > repo_url = "https://github.com/b-rodrigues/rix/",
#  > branch_name = "master",
#  > commit = latest_commit),
#  > ide = "other",
#  > project_path = "inst/extdata",
#  > overwrite = TRUE,
#  > shell_hook = NULL)
# It uses nixpkgs' revision 2d627a2a704708673e56346fcb13d25344b8eaf3 for reproducibility purposes
# which will install R version latest
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/2d627a2a704708673e56346fcb13d25344b8eaf3.tar.gz") {};
  git_archive_pkgs = [(pkgs.rPackages.buildRPackage {
    name = "rix";
    src = pkgs.fetchgit {
      url = "https://github.com/b-rodrigues/rix/";
      branchName = "master";
      rev = "88e160cf09ac0e756b6adb49a3fd0d5214f7a2fa";
      sha256 = "sha256-2zOro08S+jBzPt8K50sT2R39Kzv5joBZL0p2FZ22lVM=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) codetools httr jsonlite sys;
    };
  }) ];
  system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix ;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ git_archive_pkgs   system_packages  ];
      
  }
