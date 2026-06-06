{ den, ... }:
{
  den.aspects.browser = {
    # includes = [
    #   (den.batteries.insecure [
    #     "librewolf-152.0.2-1"
    #     "librewolf-unwrapped-152.0.2-1"
    #   ])
    # ];
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          # librewolf
          tor-browser
        ];
      };
  };
}
