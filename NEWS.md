<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# rix 0.5.0 (2024-01-07)

## Features

- Added `with_nix()`, which can evaluate a function in R or shell command via
  `nix-shell` environment, and return the output into the current R session.
  This works for both evaluating R code from a nix-R session within an other
  nix-R session, or also from a host R session (i.e., on macOS or linux) within
  a specific nix-R session. This feature is useful to test dependencies and
  specific setups of software in controlled environments.

- Added `tar_nix_ga()`, a function to run targets pipelines on Github Actions
  using a Nix expression.


# rix 0.4.1 (2023-10-06)

## Bug fixes

- `rix::rix()`: fix missing `pkgs.mkShell` when `shell_hook = NULL`.
  Both `shell_hook = ""` and `shell_hook = NULL` are now producing valid nix
  expressions.


# rix 0.4.0 (2023-09-26)

## Features

- `rix::rix()` now defaults to `"en_US.UTF-8"` for the relevant locale
  variables (`LANG`, `LC_ALL`, `LC_TIME`, `LC_MONETARY`, `LC_PAPER`,
  `LC_MEASUREMENT`) and sets these environment variables in 
  the Nix shell. These will be correctly propagated into the Nix R session.
  Users can modify the locale setting via 
  `options(rix.nix_locale_variables = list(LANG = "de_CH.UTF-8", <...>)`, e.g.,
  but it needs to be an UTF-8 locale. This is because we only import the
  `glibcLocalesUtf8` subset, to not keep the size reasonable.

## Bug fixes

- fix locale warnings when starting R in linux, which uses glibc (closes 
  [#50](https://github.com/b-rodrigues/rix/issues/50)). Now, we use
  `glibcLocalesUtf8` from Nix for "x86_64-linux".


# rix 0.3.1 (2023-09-11)

## Chore

- Remove boilerplate code for `rix::rix(tex_pkgs = NULL)`


# rix 0.3.0 (2023-09-10)

- Added support for installing TeX Live packages via new `rix::rix()` argument `tex_pkgs`.

## Chore

- update `inst/extdata/default.nix` so that it installs {rix} v0.3.0.


# rix 0.2.1.9002 (2023-09-02)

- `nix_build()` now supports `--max_jobs` flag of `nix-build` via `options(rix.nix_build_max_jobs = <integer>)`. Custom settings of this option can be useful for leveraging full I/O latency or efficient builds on shared memory multiprocessing systems.


# rix 0.2.1.9001 (2023-08-29)

- Include `nix_build()` in interactive use vignette (#68).


# rix 0.2.1.9000 (2023-08-29)

## Chore

- Fix internal `create_default_nix()` so that `project_path` is directory name.
- Updated `inst/extdata/default.nix` to latest commit of {rix} prior bumping.


# rix 0.2.1 (2023-08-26)

## Bug fixes

- Patch `rix()` to allow empty `r_pkgs` (##67).
- Patch `rix()` to do bug-free calling of `rix_build()` within default nix
  shell.

## Chore

- New internal helper `create_default_nix()` to bootstrap 
  `./inst/extdata/default.nix`


# rix 0.2.0 (2023-08-25)

## New features

- Updated Nix historical revision data to include R version 4.3.1.
- Provision a new `shell_hook` arg for `rix::rix()`, which will create a `shellHook` entry in `default.nix`.

## Bug fixes

- `inst/extdata/default.nix`: use `R --vanilla` in shellHook to not propagate user-specific `.Renviron` and `.Rprofile`. Fixes #56


# rix 0.1.2 (2023-08-14)

## Bug fixes

- Patch `inst/exdata/default.nix` so that `LOCALE_ARCHIVE` shellHook that was set to 
  glibc locale does not fail on MacOS anymore 
  ([#40](https://github.com/b-rodrigues/rix/issues/48); fixed with [37f7ab8](https://github.com/b-rodrigues/rix/commit/37f7ab84e5423721bdf05e41816dbc99353481e7)).
- `nix_build()`: fix defensive check so the error message is referring to `project_path`
  instead of `nix_file`. The patch does not change correct behavior of `nix_build()`, 
  hence it is only of cosmetic nature.


# rix 0.1.1 (2023-08-11)

## Bug fixes

- `nix_build()` now correctly checks presence of `nix-build`. ([4be69b2](https://github.com/b-rodrigues/rix/commit/4be69b2c438276a1f636f3b407a124555bb12c9b))


# rix 0.1.0 (2023-08-11)

## New features

- Added `nix_build()` helper that runs `nix-build` interactively from R. 
  ([#22](https://github.com/b-rodrigues/rix/pull/22))
- `rix()` now supports installing packages from GitHub and the CRAN archives.
- `rix()` now supports using a `nixpkgs` revision instead of an R version 
  for reproducibility
- Generated `default.nix` files now also include the call that was made to 
  generate them as top-level comment.

## Changes

- The `path` argument of `rix()` changed to `project_path`.


# rix (development version)

- Basic functionality added.
