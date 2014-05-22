import Prelude hiding (mod)
import System.IO (hPutStrLn)

import XMonad
import XMonad.Hooks.DynamicLog -- All the pretty printer logic

import XMonad.Actions.GridSelect (goToSelected, defaultGSConfig, gridselectWorkspace)
import XMonad.Actions.PhysicalScreens (viewScreen)
import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks, docksEventHook)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)

import qualified XMonad.StackSet as W

layout = avoidStruts $
         tiled
         ||| Full
  where
     tiled    = Tall nmaster delta half
     nmaster  = 1
     half     = 1/2
     delta    = 2/100

mod  = mod1Mask
modS = mod .|. shiftMask

gs = defaultGSConfig

shortcuts = [
  ((mod, xK_h), viewScreen 0),
  ((mod, xK_l), viewScreen 1),
  ((mod, xK_Tab), goToSelected gs),
  ((modS, xK_h), sendMessage Shrink),
  ((modS, xK_l), sendMessage Expand),
  ((modS, xK_r), restart "/usr/bin/obtoxmd" True),
  ((mod4Mask, xK_Left),  spawn "cmus-remote -r"),
  ((mod4Mask, xK_Right), spawn "cmus-remote -n"),
  ((mod4Mask, xK_space), spawn "cmus-remote -u")]
  -- TODO: ((mod1Mask, xK_z), toggleFullscreen?

spawnOn :: String -> String -> X ()
spawnOn _ = spawn -- FIXME

startup = do
  spawnOn "1" "terminator"
  spawnOn "2" "chromium"
  spawnOn "9" "terminator -e cmus"

focusedColor = "#ffffaf"
normalColor  = "#444444"

logger h = dynamicLogWithPP $ xmobarPP
  { ppOutput  = hPutStrLn h
  , ppCurrent = xmobarColor focusedColor "" . wrap "[" "]"
  , ppTitle   = shorten 40
  , ppVisible = wrap "[" "]"
  , ppSep     = " | "
  }

main = do
  status <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { focusFollowsMouse  = True
    , borderWidth        = 2
    , normalBorderColor  = normalColor
    , focusedBorderColor = focusedColor
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , handleEventHook    = docksEventHook <+> handleEventHook defaultConfig
    , layoutHook         = layout
    , logHook            = logger status
    , startupHook        = startup
    } `additionalKeys` shortcuts
