{pkgs, config, nix-colors, ...}: 
{
	imports = [nix-colors.homeManagerModules.default];

	colorScheme = nix-colors.colorSchemes.everforest-dark-hard;

}
