import XMonad
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)

baseConfig = desktopConfig

main = do

  xmproc <- spawnPipe "/usr/local/bin/xautolock -time 15 -locker slock"
  xmproc <- spawnPipe "/usr/X11R6/bin/xsetroot -solid lightblue"
  -- xmproc <- spawnPipe "/usr/local/bin/xmobar ~/.xmobarrc"
  xmproc <- spawnPipe "/usr/X11R6/bin/setxkbmap -option ctrl:nocaps -option compose:ralt"
  xmproc <- spawnPipe "/usr/bin/mixerctl  outputs.master=156"

  xmonad $ baseConfig
    { modMask = mod4Mask
    , terminal = "urxvt +sb"
    }
