{
  description = "A Nix flake for creating an R development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        packages = with pkgs; [
          pandoc
          quarto
          R
          radianWrapper
        ];

        rPackages = with pkgs.rPackages; [
          # Utils
          languageserver
          swirl
          swirlify
          # Project
          base64enc
          corpora
          dplyr
          factoextra
          forcats
          fs
          ggfortify
          ggplot2
          janitor
          kableExtra
          knitr
          parsnip
          purrr
          quarto
          readr
          recipes
          renv
          rmarkdown
          rsample
          rstudioapi
          scales
          skimr
          stringr
          tibble
          tidyr
          tidytext
          tidyverse
          tokenizers
          workflows
          yardstick
        ];

        allPackages = packages ++ rPackages;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = allPackages;
          shellHook = ''
            export R_LIBS_USER=$PWD/R/Library; mkdir -p "$R_LIBS_USER";
            echo "R environment set up";
          '';
        };
      });
}
