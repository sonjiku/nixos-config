{
  config,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (self: super: {
      warpd-wl =
        (super.warpd.overrideAttrs (old: {
          pname = old.pname + "-wl";
          src = super.fetchFromGitHub {
            owner = "rvaiya";
            repo = "warpd";
            rev = "01650eabf70846deed057a77ada3c0bbb6d97d6e";
            sha256 = "sha256-61+kJvOi4oog0+tGucc1rWemdx2vp15wlluJE+1PzTs=";
          };
          postPatch = ''
            substituteInPlace mk/linux.mk \
            --replace-fail 'files/warpd.1.gz $(DESTDIR)$(PREFIX)/share/man/man1/' 'files/warpd.1.gz $(DESTDIR)$(PREFIX)/share/man/man1/warpd-wl.1.gz' \
            --replace-fail '$(DESTDIR)$(PREFIX)/bin/warpd' '$(DESTDIR)$(PREFIX)/bin/warpd-wl' \
            --replace-fail 'bin/warpd $(DESTDIR)$(PREFIX)/bin/' 'bin/warpd $(DESTDIR)$(PREFIX)/bin/warpd-wl' \
            --replace-fail 'rm $(DESTDIR)$(PREFIX)/share/man/man1/warpd.1.gz' 'rm $(DESTDIR)$(PREFIX)/share/man/man1/warpd-wl.1.gz'
          '';
        }))
        .override {withX = false;};
    })
  ];
  environment.systemPackages = [
    pkgs.keyd
    pkgs.warpd-wl
  ];
  services.keyd.enable = true;
  services.keyd.keyboards = {
    #"global" = {
    #  "default_layout " = " clmkdhwd";
    #};
    default = {
      ids = ["*"];
      settings = {
        main = {
          "esc" = "capslock";
          "capslock" = "overload(vi, esc)";
          "leftalt" = "overload(alt, oneshot(lselect))";
          "rightalt" = "overload(altgr, macro(leftalt+capslock))";
        };
        lselect = {
          "1" = "toggle(clmkdhwd)";
          "2" = "toggle(clmk)";
          "3" = "toggle(qwerasdf)";
        };

        numpad = {
          "y" = "(";
          "u" = "1";
          "i" = "2";
          "o" = "3";
          "p" = "minus";
          "h" = ")";
          "j" = "4";
          "k" = "5";
          "l" = "6";
          "semicolon" = "+";
          "n" = "*";
          "m" = "7";
          "comma" = "8";
          "dot" = "9";
          "slash" = "equal";
        };

        vi = {
          "a" = "swap(numpad)";
          "u" = "home";
          "i" = "pagedown";
          "o" = "pageup";
          "p" = "end";
          "j" = "h";
          "k" = "j";
          "l" = "k";
          "semicolon" = "l";
          "m" = "left";
          "comma" = "down";
          "dot" = "up";
          "slash" = "right";
          "w" = "C-right";
          "b" = "C-left";
          "leftbrace" = "rightbrace";
          "space" = "enter";
        };
        vispread = {
          "a" = "swap(numpad)";
          "i" = "home";
          "o" = "pagedown";
          "p" = "pageup";
          "leftbrace" = "end";
          "k" = "h";
          "l" = "j";
          "semicolon" = "k";
          "apostrophe" = "l";
          "m" = "left";
          "comma" = "down";
          "dot" = "up";
          "slash" = "right";
          "w" = "C-right";
          "b" = "C-left";
          "space" = "enter";
        };

        qwerasdf = {
          "grave" = "grave";
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "0" = "0";
          "minus" = "minus";
          "equal" = "equal";
          "q" = "q";
          "w" = "w";
          "e" = "e";
          "r" = "r";
          "t" = "t";
          "y" = "y";
          "u" = "u";
          "i" = "i";
          "o" = "o";
          "p" = "p";
          "leftbrace" = "leftbrace";
          "rightbrace" = "rightbrace";
          "backslash" = "backslash";
          "a" = " a";
          "s" = " s";
          "d" = " d";
          "f" = " f";
          "g" = " g";
          "h" = " h";
          "j" = " j";
          "k" = " k";
          "l" = " l";
          "semicolon" = "semicolon";
          "apostrophe" = "apostrophe";
          "z" = " z";
          "x" = " x";
          "c" = " c";
          "v" = " v";
          "b" = " b";
          "n" = " n";
          "m" = " m";
          "comma" = "comma";
          "dot" = "dot";
          "slash" = "slash";
        };

        clmkdhwd = {
          "capslock" = "overload(vispread, esc)";
          "1" = "-";
          "2" = "1";
          "3" = "2";
          "4" = "3";
          "5" = "4";
          "6" = "5";
          "7" = "6";
          "8" = "7";
          "9" = "8";
          "0" = "9";
          "minus" = "0";
          "equal" = "equal";
          "q" = "q";
          "w" = "w";
          "e" = "f";
          "r" = "p";
          "t" = "b";
          "y" = "leftbrace";
          "u" = "j";
          "i" = "l";
          "o" = "u";
          "p" = "y";
          "leftbrace" = "semicolon";
          "rightbrace" = "apostrophe";
          "backslash" = "backslash";
          "a" = "a";
          "s" = "r";
          "d" = "s";
          "f" = "t";
          "g" = "g";
          "h" = "rightbrace";
          "j" = "m";
          "k" = "n";
          "l" = "e";
          "semicolon" = "i";
          "apostrophe" = "o";
          "z" = "x";
          "x" = "c";
          "c" = "d";
          "v" = "v";
          "b" = "z";
          "n" = "slash";
          "m" = "k";
          "comma" = "h";
          "dot" = "comma";
          "slash" = "dot";
        };

        clmk = {
          "w" = "w";
          "comma" = "comma";
          "s" = "r";
          "a" = "a";
          "c" = "c";
          "g" = "d";
          "q" = "q";
          "e" = "f";
          "rightbrace" = "rightbrace";
          "d" = "s";
          "slash" = "slash";
          "semicolon" = "o";
          "apostrophe" = "apostrophe";
          "r" = "p";
          "f" = "t";
          "t" = "g";
          "u" = "l";
          "dot" = "dot";
          "j" = "n";
          "k" = "e";
          "p" = "semicolon";
          "o" = "y";
          "z" = "z";
          "h" = "h";
          "i" = "u";
          "leftbrace" = "leftbrace";
          "v" = "v";
          "l" = "i";
          "m" = "m";
          "n" = "k";
          "x" = "x";
          "b" = "b";
          "y" = "j";
        };
      };
    };
  };
}
## Correct key names
### esc
### escape
### 1
### !
### 2
### @
### 3
### #
### 4
### $
### 5
### %
### 6
### ^
### 7
### &
### 8
### *
### 9
### (
### 0
### )
### -
### minus
### _
### =
### equal
### +
### backspace
### tab
### q
### Q
### w
### W
### e
### E
### r
### R
### t
### T
### y
### Y
### u
### U
### i
### I
### o
### O
### p
### P
### [
### leftbrace
### {
### ]
### rightbrace
### }
### enter
### leftcontrol
###
### a
### A
### s
### S
### d
### D
### f
### F
### g
### G
### h
### H
### j
### J
### k
### K
### l
### L
### ;
### semicolon
### :
### '
### apostrophe
### "
### `
### grave
### ~
### leftshift
###
### \
### backslash
### |
### z
### Z
### x
### X
### c
### C
### v
### V
### b
### B
### n
### N
### m
### M
### ,
### comma
### <
### .
### dot
### >
### /
### slash
### ?
### rightshift
### kpasterisk
### leftalt
###
### space
### capslock
### f1
### f2
### f3
### f4
### f5
### f6
### f7
### f8
### f9
### f10
### numlock
### scrolllock
### kp7
### kp8
### kp9
### kpminus
### kp4
### kp5
### kp6
### kpplus
### kp1
### kp2
### kp3
### kp0
### kpdot
### iso-level3-shift
### zenkakuhankaku
### 102nd
### f11
### f12
### ro
### katakana
### hiragana
### henkan
### katakanahiragana
### muhenkan
### kpjpcomma
### kpenter
### rightcontrol
### kpslash
### sysrq
### rightalt
### linefeed
### home
### up
### pageup
### left
### right
### end
### down
### pagedown
### insert
### delete
### macro
### mute
### volumedown
### volumeup
### power
### kpequal
### kpplusminus
### pause
### scale
### kpcomma
### hangeul
### hanja
### yen
### leftmeta
###
### rightmeta
### compose
### stop
### again
### props
### undo
### front
### copy
### open
### paste
### find
### cut
### help
### menu
### calc
### setup
### sleep
### wakeup
### file
### sendfile
### deletefile
### xfer
### prog1
### prog2
### www
### msdos
### coffee
### display
### cyclewindows
### mail
### bookmarks
### computer
### back
### forward
### closecd
### ejectcd
### ejectclosecd
### nextsong
### playpause
### previoussong
### stopcd
### record
### rewind
### phone
### iso
### config
### homepage
### refresh
### exit
### move
### edit
### zoom
### mouseback
### kpleftparen
### kprightparen
### new
### redo
### f13
### f14
### f15
### f16
### f17
### f18
### f19
### f20
### f21
### f22
### f23
### f24
### noop
### playcd
### pausecd
### prog3
### prog4
### dashboard
### suspend
### close
### play
### fastforward
### bassboost
### print
### hp
### camera
### sound
### question
### email
### chat
### search
### connect
### finance
### sport
### shop
### voicecommand
### cancel
### brightnessdown
### brightnessup
### media
### switchvideomode
### kbdillumtoggle
### kbdillumdown
### kbdillumup
### send
### reply
### forwardmail
### save
### documents
### battery
### bluetooth
### wlan
### uwb
### unknown
### next
### prev
### cycle
### auto
### off
### wwan
### rfkill
### micmute
### leftmouse
### middlemouse
### rightmouse
### mouse1
### mouse2
### fn
### mouseforward
