{
  config,
  ...
}:
{
  imports = [
    ../../shared/services/default.nix
  ];

  shared_services = {
    vikunja = {
      enable = true;
    };
  };
}
