import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
xmproc <- spawnPipe "/usr/bin/dmenu"
xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
xmproc <- spawnPipe "/usr/bin/setxkbmap -option ctrl:nocaps"

xmonad $ defaultConfig
           {modMask = mod4Mask
           , terminal = "urxvt +sb"
           , manageHook = manageDocks <+> manageHook defaultConfig
           , layoutHook = avoidStruts  $  layoutHook defaultConfig
           }
