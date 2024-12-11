{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kanata
    evtest
  ];
  services.kanata = {
    enable = true;
    keyboards = {
      "fk" = {
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (deflocalkeys-linux
            ¨ 27
            ' 12
            $ 43
            - 53
            ^ 13
            < 86
            [ 26
            ] 27
            { 40
          )
          (defalias
            ! S-¨ ;; exclamation mark
            = S-0 ;; equals
            ; S-, ;; semicolon
            at RA-2 ;; at symbol
            dq S-2 ;; double quote
            sq ' ;; single quote
            dls $ ;; dollar sign
            qm S-' ;; question mark
            pl S-1 ;; plus
            ht RA-3 ;; hashtag
            bq S-^ ;; back quote
            tld RA-^ ;; tilde
            sl S-7 ;; slash
            ast S-3 ;; asterisk
            bsl RA-< ;; backslash
            < < ;; lt
            > S-< ;; gt
            pipe RA-7 ;; pipe
            amp S-6 ;; ampersand &
            cln S-. ;; colon
            lprn S-8 ;; left paren
            rprn S-9 ;; right paren
            lbr RA-[ ;; left bracket
            rbr RA-] ;; right bracket
            lcb RA-{ ;; left curly brace
            rcb RA-$ ;; right curly brace
            mod S-5 ;; percent
          )
          (defsrc)
          (defalias conv (layer-while-held convent))
          (defalias sym (layer-while-held symbols))
          (deflayermap ( base )
            caps @conv
            ralt @sym
            ; @;
          )
          (deflayermap (convent)
            d lalt
            f tab
            y 1
            u 2
            i 3
            o 4
            p 5
            h left
            j down
            k up
            l right
            ; bspc
            n 6
            m 7
            , 8
            . 9
            - 0
          )
          (deflayermap (symbols)
            q @sq
            w @<
            e @>
            r @dq
            t @bq
            a @!
            s -
            d @pl
            f @=
            g @ht

            z ^
            x @sl
            c @ast
            v @bsl

            h @tld
            n @cln
            u @pipe
            i @lbr
            o @rbr
            p @mod
            j @amp
            k @lprn
            l @rprn
            ; @qm
            m @dls
            , @lcb
            . @rcb
            - @at
          )
        '';
      };
    };
  };
}
