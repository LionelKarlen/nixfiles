{
  den.aspects.helix = {
    homeManager = {
      xdg.configFile."helix/init.scm".source = ./files/init.scm;
      xdg.configFile."helix/mdchild.nu".source = ./files/mdchild.nu;
      xdg.configFile."helix/mdfiles.nu".source = ./files/mdfiles.nu;

      home.file.".steel/cogs/mdpick/main.scm".source = ./files/mdpick.scm;
      home.file.".steel/cogs/expansions.hx".source = fetchGit {
        url = "https://github.com/waddie/expansions.hx.git";
        rev = "fdb111263bc4d6f05084c046ea38d88c78edf07a";
      };
      home.file.".steel/cogs/run-command".source = fetchGit {
        url = "https://github.com/waddie/run-command.scm.git";
        rev = "cad0e1d5d9126e593f1ccdc031a70a766bf32be0";
      };
      home.file.".steel/cogs/ui-utils.hx".source = fetchGit {
        url = "https://github.com/waddie/ui-utils.hx.git";
        rev = "b76558ddff6cd74a68148268c31c71ad4f8f5c75";

      };
      programs.helix.settings.keys.normal = {
        tab = [
          "move_prev_word_start"
          "extend_char_left"
          ":| quoin stdio"
        ];
        "space" = {
          "[" = ":wikilink";
          "i" = {
            "c" = ":make_child_of_current";
            "n" = ":insert-callout";
            "d" = [
              "select_all_siblings"
              ":| bttf time parse -i -f flexible | bttf time fmt -f '%%Y-%%m-%%d'"
            ];
          };
          "n" = {
            "l" = "@ms[ms[";
            "b" = "@ms*ms*";
          };
          "e" = [
            ":sh rm -f /tmp/yazi-unique-file"
            '':insert-output yazi "%{buffer_name}" --chooser-file=/tmp/yazi-unique-file''
            '':sh printf "\x1b[?1049h\x1b[?2004h" > /dev/tty''
            ":open %sh{cat /tmp/yazi-unique-file}"
            ":redraw"
          ];
        };
      };
    };
  };
}
