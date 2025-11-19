{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.programming.javascript.enable (
  lib.mkMerge [
    {
      home.packages = with pkgs; [
        nodejs
      ];
    }

    (lib.mkIf config.programming.javascript.yarn {
      home.packages = with pkgs; [
        yarn
      ];
    })

    (lib.mkIf config.programming.javascript.deno {
      home.packages = with pkgs; [
        deno
      ];
    })
  ]
)
