import XMonad
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, xmobarPP, xmobarColor, ppOutput, ppUrgent)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, docksEventHook)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO (hPutStrLn)
import XMonad.Actions.PhysicalScreens (viewScreen)
import XMonad.Layout.Reflect (reflectHoriz)

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myLayout = avoidStruts $
           tiled
           ||| reflectHoriz tiled
           ||| reflectHoriz pair
           ||| Full
  where
     tiled    = Tall nmaster delta half
     pair     = Tall 2 delta most
     nmaster  = 1
     half     = 1/2
     third    = 1/3
     most     = 5/6
     delta    = 2/100

main = do
    status <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        focusFollowsMouse  = False,
        borderWidth        = 1,
        normalBorderColor  = "#666666",
        focusedBorderColor = "#ffffaf",
        -- terminal           = "xfce4-terminal",
        manageHook         = manageDocks <+> manageHook defaultConfig,
        handleEventHook    = docksEventHook <+> handleEventHook defaultConfig,
        layoutHook         = myLayout,
        logHook            = dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn status, ppUrgent = xmobarColor "yellow" "red" }
        } `additionalKeys` [
          ((mod1Mask, xK_h), viewScreen 0),
          ((mod1Mask, xK_l), viewScreen 1),
          ((mod1Mask .|. shiftMask, xK_h), sendMessage Shrink),
          ((mod1Mask .|. shiftMask, xK_l), sendMessage Expand)
        ]
