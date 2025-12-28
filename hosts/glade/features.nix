{ lib, ... }:
{
  imports = [
    ../../shared/default.nix
    ./features/default.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "spotify"
      "discord"
      "vesktop"
      "discord-canary"
      "obsidian"
      "vintagestory"
    ];

  zoxide.enable = true;
  helix.enable = true;
  helix.defaultEditor = true;
  yazi.enable = true;
  typst.enable = true;
  eza.enable = true;
  jj.enable = true;

  applications = {
    discord.enable = true;
    spotify.enable = true;
    kanri.enable = true;
    freetube.enable = true;
    calibre.enable = true;
    filezilla.enable = true;
    obsidian.enable = true;

    terminals = {
      ghostty.enable = true;
      foot.enable = true;
    };

    games = {
      steam.enable = true;
      prism.enable = true;
    };

    files = {
      sioyek.enable = true;
      vlc.enable = true;
      mpv.enable = true;
      qbittorrent.enable = true;
    };

    browsers = {
      firefox.enable = true;
      tor.enable = true;
      zen.enable = true;
      brave.enable = false;
      librewolf.enable = true;
    };

    proton = {
      vpn.enable = true;
      pass.enable = true;
    };
  };

  programming = {
    haskell.enable = true;
    rust.enable = true;
    cpp.enable = true;
    nim.enable = true;
    javascript = {
      enable = true;
      yarn = true;
      deno = true;
      bun = true;
    };
  };
}
