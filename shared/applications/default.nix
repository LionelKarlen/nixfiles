{ lib, ... }:
{
  imports = [
    ./terminals/default.nix
    ./browsers/default.nix
    ./files/default.nix
    ./games/default.nix
    ./proton/default.nix
    ./freetube.nix
    ./kanri.nix
    ./discord.nix
    ./spotify.nix
    ./calibre.nix
    ./filezilla.nix
  ];
  options.applications = {
    discord.enable = lib.mkEnableOption "enable discord (vencord)";
    freetube.enable = lib.mkEnableOption "enable freetube";
    kanri.enable = lib.mkEnableOption "enable kanri";
    spotify.enable = lib.mkEnableOption "enable spotify (spicetify)";
    calibre.enable = lib.mkEnableOption "enable calibre";
    filezilla.enable = lib.mkEnableOption "enable filezilla";
  };
}
