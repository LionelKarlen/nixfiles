{
  programs.nixvim = {
    plugins.autoclose = {
      enable = true;
      keys = {
        "<" = {
          escape = false;
          close = true;
          pair = "<>";
        };
        "(" = {
          escape = false;
          close = true;
          pair = "()";
        };
        "[" = {
          escape = false;
          close = true;
          pair = "[]";
        };
        "{" = {
          escape = false;
          close = true;
          pair = "{}";
        };
        "$" = {
          escape = false;
          close = true;
          pair = "$$";
          enabled_filetypes = ["typst"];
        };
      };
      options = {
        disabledFiletypes = null;
        autoIndent = true;
      };
    };
  };
}
