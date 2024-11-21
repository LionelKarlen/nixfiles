{modulesPath, config, pkgs, ...}: {
  system.stateVersion = "24.11";
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
    ./features/features.nix
  ];

  networking.hostName="borealis";

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  users.users.alan = {
    isNormalUser = true;
    description = "alan";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFCsUAbZ4fhMtYJL2b710Db6n8+Sj4PyTQ4L7/JVW1yL lionel@tundra"
    ];
  };

  services.openssh = {
    enable=true;
    ports = [ 505 ];
    settings = {
      PermitRootLogin="no";
      PasswordAuthentication=false;
    };
  };
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFCsUAbZ4fhMtYJL2b710Db6n8+Sj4PyTQ4L7/JVW1yL lionel@tundra"
  ];
}
