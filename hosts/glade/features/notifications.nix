{ ... }:
{
  services.mako = {
    enable = true;
    settings = {
      ignore-timeout = 1;
      default-timeout = 2000;
    };
  };
}
