{pkgs,...}: {
	imports = [
		./git.nix
		./firewall.nix
	];

	environment.systemPackages = with pkgs; [
		wget
	];
}
