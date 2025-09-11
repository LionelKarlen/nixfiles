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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nix-colors,
      nixvim,
      zen-browser,
      stylix,
      spicetify-nix,
      nix-minecraft,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        tundra = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/tundra/configuration.nix
            nix-minecraft.nixosModules.minecraft-servers
            {
              nixpkgs.overlays = [
                nix-minecraft.overlay
              ];
            }
            ./features/minecraft_server.nix
          ];
        };
        taiga = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/taiga/configuration.nix ];
        };
        glade = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/glade/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        "lionel@tundra" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/tundra/home.nix
            nixvim.homeManagerModules.nixvim
          ];
          extraSpecialArgs = {
            inherit nix-colors;
            inherit pkgs-unstable;
          };
        };
        "eepy@taiga" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/taiga/home.nix
            stylix.homeModules.stylix
            nixvim.homeManagerModules.nixvim
          ];
          extraSpecialArgs = {
            inherit nix-colors;
            inherit pkgs-unstable;
          };
        };
        "lionel@glade" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/glade/home.nix
            nixvim.homeManagerModules.nixvim
            zen-browser.homeModules.twilight
            stylix.homeModules.stylix
            spicetify-nix.homeManagerModules.spicetify
          ];
          extraSpecialArgs = {
            inherit nix-colors;
            inherit pkgs-unstable;
          };
        };
      };
    };
}
