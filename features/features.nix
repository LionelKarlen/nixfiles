{pkgs,...}: {
	imports = [
		./git.nix
	];

	environment.systemPackages = with pkgs; [
		wget
	];
}
