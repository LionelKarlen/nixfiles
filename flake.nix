{
	description="Tundra config flake";
	inputs={
		nixpkgs.url="nixpkgs/nixos-24.05";
		nixpkgs-unstable.url="nixpkgs/nixos-unstable";
		home-manager.url="github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows="nixpkgs";
		nix-colors.url="github:misterio77/nix-colors";
		nixvim = {
			url="github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows="nixpkgs";
		};
	};
	outputs={self,nixpkgs,nixpkgs-unstable,home-manager,nix-colors,nixvim,...}:
	let
		system="x86_64-linux";
		pkgs=nixpkgs.legacyPackages.${system};
		pkgs-unstable=nixpkgs-unstable.legacyPackages.${system};
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
		};
		homeConfigurations = {
			lionel = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
				./home.nix
				nixvim.homeManagerModules.nixvim
				];
				extraSpecialArgs={
					inherit nix-colors;
					inherit pkgs-unstable;
				};

			};
			eepy = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
				./eepy.nix
				nixvim.homeManagerModules.nixvim
				];
				extraSpecialArgs={
					inherit nix-colors;
					inherit pkgs-unstable;
				};

			};

		};
	};
}
