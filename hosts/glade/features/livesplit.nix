{ pkgs, pkgs-unstable, ... }:
{

  nixpkgs.overlays = [
    (final: prev: {
      livesplit-one-druid =
        pkgs-unstable.callPackage ./../../../packages/livesplit-one/livesplit-one.nix
          { };
    })
  ];

  security.wrappers = {
    livesplit-one-druid = {
      owner = "root";
      group = "root";
      capabilities = "CAP_SYS_PTRACE=+eip";
      source = "${pkgs.livesplit-one-druid}/bin/livesplit-one";
    };
  };

  environment.systemPackages = [
    pkgs.livesplit-one-druid
  ];

}
