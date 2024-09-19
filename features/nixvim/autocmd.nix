{...}: {
  programs.nixvim = {
    autoGroups = {
      highlight-yank = {
        clear = true;
      };
    };
    autoCmd = [
      {
        event = ["TextYankPost"];
        desc = "Highlight yank test";
        group = "highlight-yank";
        callback.__raw = ''
          function()
          	vim.highlight.on_yank()
          end
        '';
      }
    ];
  };
}
