#include, BaseUtil.ahk
;=====================================================================o
;                   Feng Ruohang's AHK Script                         | 
;                      CapsLock Enhancement                           |
;---------------------------------------------------------------------o
;Description:                                                         |
;    This Script is wrote by Feng Ruohang via AutoHotKey Script. It   |
; Provieds an enhancement towards the "Useless Key" CapsLock, and     |
; turns CapsLock into an useful function Key just like Ctrl and Alt   |
; by combining CapsLock with almost all other keys in the keyboard.   |
;                                                                     |
;Summary:                                                             |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + uiop       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + zxcvay     | Windows-Style Editor                        |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}~{F6}  | Media Volume Controller                     |
;|CapsLock + qs         | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + dfert      | Frequently Used Programs (Self Defined)     |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;-----------------------o---------------------------------------------o
;|Use it whatever and wherever you like. Hope it help                 |
;=====================================================================o


;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
    if GetKeyState("alt") = 0                                        ;|
    {
        GetKeyState, CapsLockState, CapsLock, T                              ;|
        if CapsLockState = D                                                 ;|
            SetCapsLockState, AlwaysOff                                      ;|
        else                                                                 ;|
            SetCapsLockState, AlwaysOn                                       ;|
        KeyWait, ``                                                          ;|
    }
    else
    {
        WinGet, activeProcessName, ProcessName, A
        HandleWindowsWithSameProcessAndClass(activeProcessName)
    }
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
Send, {Left}                                                         ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & j::                                                       ;|
Send, {Down}                                                         ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & k::                                                       ;|
Send, {Up}                                                           ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & l::                                                       ;|
Send, {Right}                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;-----------------------------------o---------------------------------o
CapsLock & u:: Send, {PgUp}                                          ;|
;-----------------------------------o---------------------------------o
CapsLock & p:: Send, {PgDn}                                          ;|
;---------------------------------------------------------------------o



;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + Delete (Delete a Word) ;|
;                     CapsLock + m  |  Delete                        ;|
;                     CapsLock + ,  |  BackSpace                     ;|
;                     CapsLock + .  |  Ctrl + BackSpace              ;|
;-----------------------------------o---------------------------------o
CapsLock & m:: Send, ^{Del}                                          ;|
CapsLock & n:: Send, ^{BS}                                           ;|

;---------------------------------------------------------------------o

;-----------------------------------o---------------------------------o
CapsLock & s::
if GetKeyState("alt") = 0                                            ;|
{                                                                    ;|
    Send, ^{Tab}                                                     ;|
}                                                                    ;|
else                                                                 ;|
{                                                                    ;|
    Send, ^+{Tab}                                                    ;|
}                                                                    ;|
return                                                               ;|

;-----------------------------------o                                ;|
CapsLock & q:: Send, !{F4}                                           ;|
;---------------------------------------------------------------------o


;-------------------------Application--------------------------------;|

CapsLock & t:: OpenOrShowAppBasedOnExeName("C:\Users\kiriyuan\AppData\Local\Programs\Microsoft VS Code\Code.exe")
CapsLock & r:: OpenOrShowAppBasedOnExeName("C:\Program Files\Tencent\WeTERM\WeTERM.exe")
CapsLock & y:: OpenOrShowAppBasedOnExeName("D:\Soft\XMind_ZEN\XMind.exe")

CapsLock & x:: 
OpenOrShowAppBasedOnExeName("C:\Program Files\Google\Chrome\Application\chrome.exe")
return

CapsLock & g:: 
OpenOrShowAppBasedOnExeName("C:\Program Files\TencentDocs\TencentDocs.exe")
return

CapsLock & f:: 
Send, #e
return 

;---------------_----------  Terminal  --------------------------------;|
CapsLock & a:: Send, ^a                                                ;|
CapsLock & c:: Send, ^c                                                ;|
CapsLock & d:: Send, ^d                                                ;|
CapsLock & e:: Send, ^e                                                ;|
CapsLock & v:: Send, ^v                                                ;|
CapsLock & w:: Send, ^w                                                ;|

; Secondary Leader Key
CapsLock & b:: 
    prevCaseSense := A_StringCaseSense
    StringCaseSense, On

    Input, pressedKey, L1 T0.8 E
    switch pressedKey
    {
    case "x": Send, ^!+M ; MAA
    case "s": Send, ^s   ; Ctrl+s
    case "q": Send, ^!w
    case "w": Send, +!w
    ; case "s": ToggleXimalaya()
    ; case "X": ActivateWindowByProcName("XMind.exe")
    ; case "f": ActivateWindowByProcName("Q-Dir.exe")
    ; case "e": ActivateWindowByProcName("emacs.exe")

    default:
        ToolTipMgr.ShowTooltip({text:"Unrecognized key <" . pressedKey . "> pressed"})
    }

    StringCaseSense, %prevCaseSens%
return
return

; CapsLock & r:: Run D:\Soft\XMind_ZEN\XMind.exe                       ;|
; CapsLock & r:: ActivateWindowByProcName("XMind.exe")                 ;|
; CapsLock & t:: Send, !q    ;|
; ---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Char Mapping                       ;|
;-----------------------------------o---------------------------------o

CapsLock & /::                                                       ;|
Send, ^/                                                             ;|
return                                                               ;|

; VSCODE HINT
CapsLock & \::                                                       ;|
Send, ^\                                                             ;|
return                                                               ;|



; ---------------------------------------------------------------------