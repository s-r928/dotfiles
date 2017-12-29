import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import qualified Data.Map as M

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myPP = xmobarPP {
    ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
    }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myBar = "xmobar ~/.xmobarrc"

myConfig = defaultConfig {
    terminal = "xfce4-terminal"
    , borderWidth = 2
    , normalBorderColor = "#112211"
    , focusedBorderColor = "#dc322f"
    , keys  =   \c -> mykeys c `M.union` keys defaultConfig c
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , manageHook = manageHook defaultConfig <+> manageDocks
    }
    where
        mykeys  (XConfig {modMask = modm}) = M.fromList $
            [ 
            ((modm, xK_o), spawn "xfce4-terminal -e ranger")
            ]
