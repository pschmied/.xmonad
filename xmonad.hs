import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do

xmproc <- spawnPipe "/usr/local/bin/xautolock -time 15 -locker slock"
xmproc <- spawnPipe "/usr/local/bin/xsetroot -solid gray"
xmproc <- spawnPipe "/usr/local/bin/xmobar ~/.xmobarrc"
xmproc <- spawnPipe "/usr/local/bin/setxkbmap -option ctrl:nocaps"

xmonad $ defaultConfig
           {modMask = mod4Mask
           , terminal = "urxvt +sb"
           , manageHook = manageDocks <+> manageHook defaultConfig
           , layoutHook = avoidStruts  $  layoutHook defaultConfig
           }
