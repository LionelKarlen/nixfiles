{pkgs, ...}: {
  home.packages = with pkgs; [
    ghc
    haskell-language-server
    stack
    cabal-install
  ];

  programs.nixvim.plugins.lsp.servers.hls = {
    enable = true;
    installGhc = true;
  };
}
