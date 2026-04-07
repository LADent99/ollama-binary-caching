{
  description = "ollama binary cache";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
        #   default = pkgs.ollama;
          # If you use CUDA:
          default = pkgs.ollama-cuda;
          # If you use ROCm (AMD):
          # default = pkgs.ollama-rocm;
        };
      });
}