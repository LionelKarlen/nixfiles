{ lib, config, ... }:
lib.mkIf config.yazi.enable {

  programs.helix.settings.keys.normal = {
    tab = [
      "move_prev_word_start"
      "extend_char_left"
      '':| quoin stdio''
    ];
    space = {
      "e" = [
        ":sh rm -f /tmp/yazi-unique-file"
        '':insert-output yazi "%{buffer_name}" --chooser-file=/tmp/yazi-unique-file''
        '':sh printf "\x1b[?1049h\x1b[?2004h" > /dev/tty''
        ":open %sh{cat /tmp/yazi-unique-file}"
        ":redraw"
      ];
    };
  };
}
