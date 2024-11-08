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
          R
          radianWrapper
        ];

        rPackages = with pkgs.rPackages; [
          languageserver
          swirl
          swirlify
        ];

        allPackages = packages ++ rPackages;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = allPackages;
        };
      });
}
