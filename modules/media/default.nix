{
  den.aspects.media = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          calibre
          mpv
          vlc
          filezilla
          qbittorrent
          jellyfin-media-player
        ];
      };
  };
}
