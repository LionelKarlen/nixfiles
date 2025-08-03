{
  description = "Tundra config flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    roc.url = "github:roc-lang/roc";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nix-colors,
    nixvim,
    roc,
    zen-browser,
    stylix,
    spicetify-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    roc_pkgs = roc.packages.${system};
  in {
    nixosConfigurations = {
      tundra = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./configuration.nix];
      };
      taiga = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./taiga-configuration.nix];
      };
      glade = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./glade-configuration.nix
        ];
      };
    };
    homeConfigurations = {
      lionel = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = {
          inherit nix-colors;
          inherit pkgs-unstable;
          inherit roc_pkgs;
        };
      };
      eepy = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./eepy.nix
          nixvim.homeManagerModules.nixvim
        ];
        extraSpecialArgs = {
          inherit nix-colors;
          inherit pkgs-unstable;
          inherit roc_pkgs;
        };
      };
      "lionel@glade" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./glade-home.nix
          nixvim.homeManagerModules.nixvim
          zen-browser.homeModules.twilight
          stylix.homeModules.stylix
          spicetify-nix.homeManagerModules.spicetify
        ];
        extraSpecialArgs = {
          inherit nix-colors;
          inherit pkgs-unstable;
          inherit roc_pkgs;
        };
      };
    };
  };
}
