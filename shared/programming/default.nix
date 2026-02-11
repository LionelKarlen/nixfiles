{ lib, ... }:
{
  imports = [
    ./haskell.nix
    ./nim.nix
    ./rust.nix
    ./cpp.nix
    ./javascript.nix
    ./go.nix
    ./dart.nix
    ./zig.nix
  ];
  options.programming = {
    haskell.enable = lib.mkEnableOption "enable haskell";
    nim.enable = lib.mkEnableOption "enable nim";
    rust.enable = lib.mkEnableOption "enable rust";
    cpp.enable = lib.mkEnableOption "enable c++";
    javascript.enable = lib.mkEnableOption "enable javascript";
    javascript.yarn = lib.mkEnableOption "enable yarn";
    javascript.deno = lib.mkEnableOption "enable deno";
    javascript.bun = lib.mkEnableOption "enable bun";
    go.enable = lib.mkEnableOption "enable go";
    dart.enable = lib.mkEnableOption "enable dart";
    zig.enable = lib.mkEnableOption "enable zig";
  };
}
