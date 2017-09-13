import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll
    [
    ]

main = do
    xmproc <- spawnPipe "gnome-session"
    xmproc <- spawnPipe "xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        -- , logHook = dynamicLogWithPP $ xmobarPP
        --                 { ppOutput = hPutStrLn xmproc
        --                 , ppTitle = xmobarColor "green" "" . shorten 50
        --                 }
        , terminal = "urxvt"
        , normalBorderColor = "#586e75"
        , focusedBorderColor = "#b58900"
        } `additionalKeys`
        [ ((controlMask .|. mod4Mask, xK_l), spawn "gnome-screensaver-command -l")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
