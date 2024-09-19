{config, lib, pkgs, ...}:
{
	programs.tmux = {
		enable=true;
		escapeTime=10;
		keyMode="vi";
		prefix="C-a";
	};
}
