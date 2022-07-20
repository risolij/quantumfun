{
  description = "Python Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { 
          inherit system;
        };
      in
      with pkgs;
      {
        devShell = mkShell {
          buildInputs = [
            exa
            pkgs.python39
            pkgs.python39Packages.pylatexenc
            pkgs.python39Packages.ipython
            pkgs.python39Packages.jupyter
            pkgs.python39Packages.numpy
            pkgs.python39Packages.plotly
            pkgs.python39Packages.pandas
            pkgs.python39Packages.qiskit
            pkgs.python39Packages.matplotlib
          ];

            ## alias ls='exa --icons'
            ## export PIP_PREFIX=$(pwd)/_build/pip_packages
            ## export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
            ## export PATH="$PIP_PREFIX/bin:$PATH"
            ## unset SOURCE_DATE_EPOCH
            ## jupyter notebook
          shellHook = ''
          '';
        };
      }
    );
}


