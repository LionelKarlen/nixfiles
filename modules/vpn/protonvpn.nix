{
  den.aspects.vpn = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          protonvpn-gui
        ];
      };
  };
}
