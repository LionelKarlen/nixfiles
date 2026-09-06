{ inputs, ... }:
{

  flake-file.inputs = {
    smos.url = "github:NorfairKing/smos";
  };

  den.aspects.edu = {
    homeManager = {
      imports = [
        inputs.smos.homeManagerModules."x86_64-linux".default
      ];
      programs.smos = {
        enable = true;

        config = {
          reset = true;

          browser = {
            empty = [
              {
                key = "e";
                action = "browserStartNew";
              }
            ];

            existent = [
              {
                key = "e";
                action = "browserStartNew";
              }
            ];
          };

          explainer-mode = true;
        };
      };

    };
  };
}
