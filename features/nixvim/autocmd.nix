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
      {
        event = ["VimEnter"];
        desc = "Open yazi on neovim enter";
        callback.__raw = ''
          function()
            if vim.g.open_yazi ~= nil then
              vim.cmd(":Yazi")
            end
          end
        '';
      }
    ];
    # This section stops netrw from showing up when opening a directory
    extraConfigLua = ''
          vim.cmd('silent! autocmd! FileExplorer *')
      vim.cmd('autocmd VimEnter * ++once silent! autocmd! FileExplorer *')
    '';
  };
}
