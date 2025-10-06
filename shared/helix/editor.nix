{ ... }:
{
  programs.helix.settings.editor = {
    cursor-shape = {
      normal = "block";
      insert = "bar";
    };

    soft-wrap = {
      enable = true;
      wrap-indicator = "";
    };

    color-modes = true;
    auto-pairs = true;
    line-number = "relative";

    indent-guides = {
      render = true;
    };

    end-of-line-diagnostics = "hint";
    inline-diagnostics = {
      cursor-line = "warning";
      other-lines = "hint";
    };
  };
}
