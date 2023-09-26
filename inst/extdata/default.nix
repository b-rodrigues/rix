# This file was generated by the {rix} R package v0.3.1 on 2023-09-25
# with following call:
# >rix(r_ver = "976fa3369d722e76f37c77493d99829540d43845",
#  > r_pkgs = NULL,
#  > system_pkgs = NULL,
#  > git_pkgs = list(package_name = "rix",
#  > repo_url = "https://github.com/b-rodrigues/rix/",
#  > branch_name = "master",
#  > commit = "ae39d2142461688b1be41db800752a949ebb3c7b"),
#  > ide = "other",
#  > project_path = "inst/extdata",
#  > overwrite = TRUE)
# It uses nixpkgs' revision 976fa3369d722e76f37c77493d99829540d43845 for reproducibility purposes
# which will install R as it was as of nixpkgs revision: 976fa3369d722e76f37c77493d99829540d43845
# Report any issues to https://github.com/b-rodrigues/rix
let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/976fa3369d722e76f37c77493d99829540d43845.tar.gz") {};
  git_archive_pkgs = [(pkgs.rPackages.buildRPackage {
    name = "rix";
    src = pkgs.fetchgit {
      url = "https://github.com/b-rodrigues/rix";
      branchName = "master";
      rev = "b4501842723ef19391c7653e0b44a487505d89f2";
      sha256 = "sha256-pQdRKxzNhDPPWW1T9oaQEtkLTdmU0+Ry0aGzEGfeYFo=";
    };
    propagatedBuildInputs = builtins.attrValues {
      inherit (pkgs.rPackages) httr jsonlite sys;
    };
  }) ];
  system_packages = builtins.attrValues {
  inherit (pkgs) R glibcLocales nix;
};
  in
  pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then  "${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive" else "";
    LANG = en_US.UTF-8;
    LC_ALL = en_US.UTF-8;
    LC_TIME = en_US.UTF-8;
    LC_MONETARY = en_US.UTF-8;
    LC_PAPER = en_US.UTF-8
    buildInputs = [ git_archive_pkgs   system_packages  ];
      shellHook = "R --vanilla";
  }
