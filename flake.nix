{
  description = "Numerical methods";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
  };

  outputs = { self, nixpkgs }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python3
          pkgs.uv
        ];
      };
    };
}
