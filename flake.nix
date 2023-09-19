{
  description = "fastapi-nix-experiment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    mach-nix.url = "github:davhau/mach-nix";
  };

  outputs = { self, nixpkgs, mach-nix, flake-utils, ... }:
    let
      pythonVersion = "python310";
    in
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        mach = mach-nix.lib.${system};

        pythonAppEnv = mach.mkPython rec {
          python = pythonVersion;
          requirements = builtins.readFile ./requirements.txt;
        };

        devShell = pkgs.mkShell rec {
          buildInputs = [
            pythonAppEnv
          ];

          shellHook = ''
            export PYTHONPATH="${pythonAppEnv}/bin/python"
          '';
        };

        defaultPackage = pythonAppEnv;
      in {
        inherit devShell defaultPackage;
      }
    );
}
