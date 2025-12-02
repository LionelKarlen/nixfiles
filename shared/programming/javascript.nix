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
        typescript-language-server
        typescript
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

    (lib.mkIf config.programming.javascript.bun {
      home.packages = with pkgs; [
        bun
      ];
    })
  ]
)
