{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    nixpkgs,
    disko,
    ...
  }: {
    nixosConfigurations.borealis = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./configuration.nix
        ./disk-config.nix
      ];
    };
  };
}
