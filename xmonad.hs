import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do

xmproc <- spawnPipe "/usr/local/bin/xautolock -time 15 -locker slock"
xmproc <- spawnPipe "/usr/X11R6/bin/xsetroot -solid gray"
xmproc <- spawnPipe "/usr/local/bin/xmobar ~/.xmobarrc"
xmproc <- spawnPipe "/usr/X11R6/bin/setxkbmap -option ctrl:nocaps -option compose:ralt"
xmproc <- spawnPipe "/usr/bin/mixerctl  outputs.master=156"

xmonad $ defaultConfig
           {modMask = mod4Mask
           , terminal = "urxvt +sb"
           , manageHook = manageDocks <+> manageHook defaultConfig
           , layoutHook = avoidStruts  $  layoutHook defaultConfig
           }
