{...}:
let
hostname = "susco.ch";
in{
imports = [
../../../shared/services/default.nix
];

shared_services = {
caddy = {
enable = true;
};

vikunja = {
enable = true;
hostname = "todo."+hostname;
port = 3000;
};
};


networking.firewall = {
enable = true;
allowedTCPPorts = [80 443 505];
};
}

