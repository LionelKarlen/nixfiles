{lib,config,...}:
{
	imports = [
		./nixvim/autocmd.nix
		./nixvim/plugins.nix
		./nixvim/options.nix
		./nixvim/keymaps.nix
	];

	programs.nixvim = {
		enable=true;
		defaultEditor=true;
	};
}
