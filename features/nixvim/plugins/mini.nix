{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│";
        };
        whitespace = {
          remove_blankline_trail = true;
        };
        scope = {
          enabled = false;
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };
    plugins.mini = {
      enable = true;
      modules = {
        ai = {
          n_lines = 300;
        };
        surround = {
        };
        starter = {
          header = "hi :)";
        };
        statusline = {
          use_icons.__raw = "vim.g.have_nerd_font";
        };
        indentscope = {
          draw = {
            delay = 100;
          };
          symbol = "│";
        };
      };
    };
    extraConfigLua = ''
      require('mini.statusline').section_location=function()
      	return '%2l:%-2v'
      end
    '';
  };
}
