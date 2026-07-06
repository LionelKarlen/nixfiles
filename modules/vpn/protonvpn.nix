{
  den.aspects.vpn = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          proton-vpn
        ];
      };
  };
}
