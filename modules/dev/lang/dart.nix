{
  den.aspects.dart = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          dart
        ];
      };
  };
}
