{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "minecraft-server"
    ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = false;
    servers = {
      hc = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_8;
        serverProperties = {
          motd = "hi-lo :)";
          difficulty = "hard";
          gamemode = "survival";
          hardcore = true;
          level-name = "hilo";
          spawn-protection = 0;
        };
        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            fabricapi = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/zhzhM2yQ/fabric-api-0.130.0%2B1.21.8.jar";
              hash = "sha256-k/+F7dZLgCltzTcttFJaMzJoDKnAeQ4o6StVBSkBdYk=";
            };
            ferritecore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/CtMpt7Jr/ferritecore-8.0.0-fabric.jar";
              hash = "sha256-K5C/AMKlgIw8U5cSpVaRGR+HFtW/pu76ujXpxMWijuo=";
            };
            spark = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/l6YH9Als/versions/3KCl7Vx0/spark-1.10.142-fabric.jar";
              hash = "sha256-Uw1UTpxV2X5ZTjE7zaxbRCOdWxXQ54r1duLE0xvSzS0=";
            };
            sodium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/AANobbMI/versions/ND4ROcMQ/sodium-fabric-0.6.13%2Bmc1.21.6.jar";
              hash = "sha256-LmeBKYBoi/M0RwUsnd+4INB5Z7s6NEP3hlaH+ghpEY0=";
            };
            lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/pDfTqezk/lithium-fabric-0.18.0%2Bmc1.21.8.jar";
              hash = "sha256-kBPy+N/t6v20OBddTHZvW0E95WLc0RlaUAIwxVFxeH4=";
            };
            chunky = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/fALzjamp/versions/inWDi2cf/Chunky-Fabric-1.4.40.jar";
              hash = "sha256-TdVDDtm0K/t+TtEKPsBN7gjGv1dJO6hydpo6jvEKcMI=";
            };
            servux = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/3LUmmXJf/servux-fabric-1.21.8-0.7.3.jar";
              hash = "sha256-Sey74mdYyMdw6FiYjhLMBewNHaPNcjoV34dLQ5GjtAw=";
            };
            invisibleframes = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/QD87oMUf/versions/S48QrgU7/invisibleframes-1.5.0%2B1.21.6.jar";
              hash = "sha256-+tqnLfsJaP10E+HFZwm0631EaSe/ra4E+DopsRW1EOU=";
            };
            carpet = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/RXcxPvgC/fabric-carpet-1.21.7-1.4.177%2Bv250630.jar";
              hash = "sha256-9axapepvXS/bWOUkV4L0cPulJK7mxHJoawQHJWM82RA=";
            };
            fake_afk = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/wW2N9HyO/versions/My95V28y/fake_afk-1.0.6-1.21.6.jar";
              hash = "sha256-nVAm08vdM2PBHUslsYaCZ9EW9a2cAmaQ33uRdXIlaNk=";
            };
          });
        };
      };
    };
  };
}
