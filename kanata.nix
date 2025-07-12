{
  services.kanata = {
    enable = true;
    keyboards = {
      kanata.extraDefCfg = "process-unmapped-keys yes";
      kanata.config = ''
  (defsrc

  esc            f1   f2   f3   f4             f5    f6    f7    f8          f9   f10  f11   f12
  grv       1      2    3      4      5       6     7      8     9      0       -      =    bspc
  tab       q      w    e      r      t       y     u      i     o      p       [      ]       \
  caps      a      s    d      f      g       h     j      k     l      ;       '          enter
  lsft      z      x    c      v      b       n     m      ,     .      /                   rsft           up
  lctl      lmet   lalt             spc                  ralt        rmet                   rctl      lft down rght
  
  )
  
  (deflayer default
  
  esc            f1   f2   f3   f4               f5    f6    f7    f8          f9   f10  f11   f12
  grv       1      2    3      4       5       6     7      8     9      0       -      =     bspc
  tab       q      w    f      g       b       ,     y     @l    @u      .       [      ]        \
  bspc     @a     @r   @s     @t       d       h    @n     @e    @i     @o       '           enter
  @sbl     z      x    p      @c       j       v     m      k     /      ;                    rsft         up
  lctl      lmet   lalt              @sl                 ralt        rmet                     rctl    lft down rght
  
  )
  
  (deflayer c
  
  esc            f1   f2   f3   f4             f5    f6    f7    f8          f9   f10  f11   f12
  grv       1      2    3      4      5       6     7      8     9      0       -      =    bspc
  tab       q      w    e      r      t       y     u      i     o      p       [      ]       \
  caps      a      s    d      f      lctl    ;     h      j     k      l       '          enter
  lsft      z      x    c      v      b       n     m      ,     .      /                   rsft           up
  lctl      lmet   lalt             spc                  ralt        rmet                   rctl      lft down rght
  
  )
  
  (deflayer l
  
  esc            f1   f2   f3   f4             f5    f6    f7    f8          f9   f10  f11   f12
  grv       1      2    3      4      5       6     7      8     9      0       -      =    bspc
  tab       A-1    A-2  A-3    A-4    A-5     A-6   C-8  A-8   S-f10  S-f10   S--    S-=     \
  caps      C-1    C-2  C-3    C-4    C-5     C-6   C-7    j     k      l       '          enter
  lsft      z      x    c      v      b       n     m      ,     .      /                   rsft           up
  lctl      lmet   lalt             spc                  ralt        rmet                   rctl      lft down rght
  
  )
  
  (deflayer u
  
  esc            f1   f2   f3   f4             f5    f6    f7    f8          f9   f10  f11   f12
  grv       1      2    3      4      5       6     7      8     9      0       -      =    bspc
  tab       A-1    A-2  A-3    A-4    A-5     A-6   A-7  A-8   S-f10  S-f10   S--    S-=     \
  caps      A-1    A-2  A-3    A-4    A-5     A-6   A-7    j     k      l       '          enter
  lsft      z      x    c      v      b       n     m      ,     .      /                   rsft           up
  lctl      lmet   lalt             spc                  ralt        rmet                   rctl      lft down rght
  
  )
  
  (deflayer sl
  
  esc            f1   f2   f3   f4             f5    f6    f7    f8          f9   f10  f11   f12
  grv       f1     f2   f3     f4     f5      f6    f7     f8    f9     f10    f11     f12  caps
  tab       1      2    3      4      5       6     7      8     9      0      -       =       \
  enter     \      grv  lsft   lctl   /       ;     lft    down  up     rght    '          enter
  tab       z      x    ,      ,      ,       .     S-;    m     /      ;                   rsft           up
  lctl      lmet   lalt             spc                  ralt        rmet                   rctl      lft down rght
  
  )
  
  (deflayer sbl
  
  esc            f1   f2   f3   f4               f5    f6    f7    f8          f9   f10  f11   f12
  grv       S-1    S-2  S-3    S-4     S-5     S-6   S-7    S-8   S-9    S-0     S--    S-=   bspc
  tab       S-1    S-2  S-3    S-4     S-5     S-6   S-7    S-8   S-f10  S-f10   S--    S-=     \
  bspc      S-,    S-.  lsft   lctl    del     [     S-9    -     =      S-0     ]           enter
  lsft      z      x    c      v       ,       b     k      m     /      ;                    rsft         up
  lctl      lmet   lalt               spc                ralt        rmet                     rctl    lft down rght
  
  )
  
  (defvar
    tap-time 200
    hold-time 200
  )
  
  (defalias
    a (tap-hold $tap-time $hold-time a lmet)
    r (tap-hold $tap-time $hold-time r lalt)
    s (tap-hold $tap-time $hold-time s lsft)
    t (tap-hold $tap-time $hold-time t lctl)
    n (tap-hold $tap-time $hold-time n rctl)
    e (tap-hold $tap-time $hold-time e rsft)
    i (tap-hold $tap-time $hold-time i ralt)
    o (tap-hold $tap-time $hold-time o rmet)
    sbl (tap-hold $tap-time $hold-time esc (layer-toggle sbl))
    sl  (tap-hold $tap-time $hold-time spc (layer-toggle sl))
    c   (tap-hold $tap-time $hold-time c (layer-toggle c))
    u   (tap-hold $tap-time $hold-time u (layer-toggle u))
    l   (tap-hold $tap-time $hold-time l (layer-toggle l))
  )
        '';
      };
    };
}
