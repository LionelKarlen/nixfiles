{ inputs, ... }:
{

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];

  # flake-file.inputs = {
  #   den.url = "github:denful/den";
  #   flake-file.url = "github:denful/flake-file";
  #   import-tree.url = "github:denful/import-tree";
  #   home-manager = {
  #     url = "github:nix-community/home-manager";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  # };
  flake-file.inputs = {
    den.url = "github:denful/den";
    flake-file.url = "github:denful/flake-file";
  };

}
