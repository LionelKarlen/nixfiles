{ lib, ... }:
{
  imports = [
    ./haskell.nix
    ./nim.nix
    ./rust.nix
    ./cpp.nix
    ./deno.nix
  ];
  options.programming = {
    haskell.enable = lib.mkEnableOption "enable haskell";
    nim.enable = lib.mkEnableOption "enable nim";
    rust.enable = lib.mkEnableOption "enable rust";
    cpp.enable = lib.mkEnableOption "enable c++";
    deno.enable = lib.mkEnableOption "enable deno";
  };
}
