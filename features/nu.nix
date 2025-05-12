{...}: {
  programs.nushell = {
    enable = true;
    configFile.text = ''
      $env.config.shell_integration.osc133 = false
    '';
  };
}
