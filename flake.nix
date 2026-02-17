{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs =
    {
      nixpkgs,
      devshell,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            devshell.overlays.default
          ];
        };

        opentofu = pkgs.opentofu;
      in
      {
        devShells = rec {
          default = site;
          site = pkgs.devshell.mkShell {
            name = "site";
            packages = [
              opentofu
            ];
            devshell.startup.version_info.text = ''
              echo "-------ejoneid-infra environment--------"
              echo "opentofu: $(${opentofu}/bin/tofu --version)"
              echo "----------------------------------------"
            '';
          };
        };
      }
    );
}
