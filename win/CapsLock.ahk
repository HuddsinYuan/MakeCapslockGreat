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


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          ;|
;                      CapsLock + o |  End                           ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
; CapsLock & i::                                                       ;|
; if GetKeyState("control") = 0                                        ;|
; {                                                                    ;|
;     if GetKeyState("alt") = 0                                        ;|
;         Send, {Home}                                                 ;|
;     else                                                             ;|
;         Send, +{Home}                                                ;|
;     return                                                           ;|
; }                                                                    ;|
; else {                                                               ;|
;     if GetKeyState("alt") = 0                                        ;|
;         Send, ^{Home}                                                ;|
;     else                                                             ;|
;         Send, +^{Home}                                               ;|
;     return                                                           ;|
; }                                                                    ;|
; return                                                               ;|
; ;-----------------------------------o                                ;|
; CapsLock & o::                                                       ;|
; if GetKeyState("control") = 0                                        ;|
; {                                                                    ;|
;     if GetKeyState("alt") = 0                                        ;|
;         Send, {End}                                                  ;|
;     else                                                             ;|
;         Send, +{End}                                                 ;|
;     return                                                           ;|
; }                                                                    ;|
; else {                                                               ;|
;     if GetKeyState("alt") = 0                                        ;|
;         Send, ^{End}                                                 ;|
;     else                                                             ;|
;         Send, +^{End}                                                ;|
;     return                                                           ;|
; }                                                                    ;|
; return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + u |  PageUp                        ;|
;                      CapsLock + p |  PageDown                      ;|
;-----------------------------------o---------------------------------o
CapsLock & u:: Send, {PgUp}                                          ;|
;-----------------------------------o---------------------------------o
CapsLock & p:: Send, {PgDn}                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
; CapsLock & Up::    MouseMove, 0, -50, 0, R                           ;|
; CapsLock & Down::  MouseMove, 0, 50, 0, R                            ;|
;  & Left::  MouseMove, -50, 0, 0, R                           ;|
; sLock &   0, R                            ;|
;-----------------------------------o                                ;|
; CapsLock & Enter::                                                   ;|
; SendEvent {Blind}{LButton down}                                      ;|
; KeyWait Enter                                                        ;|
; SendEvent {Blind}{LButton up}                                        ;|
; return                                                               ;|
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


;=====================================================================o
;                            CapsLock Editor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + z  |  Ctrl + z (Cancel)             ;|
;                     CapsLock + x  |  Ctrl + x (Cut)                ;|
;                     CapsLock + c  |  Ctrl + c (Copy)               ;|
;                     CapsLock + v  |  Ctrl + z (Paste)              ;|
;                     CapsLock + a  |  Ctrl + a (Select All)         ;|
;                     CapsLock + y  |  Ctrl + z (Yeild)              ;|
;                     CapsLock + w  |  Ctrl + Right(Move as [vim: w]);|
;                     CapsLock + b  |  Ctrl + Left (Move as [vim: b]);|
;-----------------------------------o---------------------------------o
; CapsLock & z:: Send, ^z                                              ;|
; CapsLock & x:: Send, ^x                                              ;|
; CapsLock & c:: Send, ^c                                              ;|
; CapsLock & v:: Send, ^v                                              ;|
; CapsLock & a:: Send, ^a                                              ;|
; CapsLock & y:: Send, ^y                                              ;|
; CapsLock & w:: Send, ^{Right}                                        ;|
; CapsLock & b:: Send, ^{Left}                                         ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F3  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Next                    ;|
;                    CapsLock + F6  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
; CapsLock & F1:: Send, {Volume_Mute}                                  ;|
; CapsLock & F2:: Send, {Volume_Down}                                  ;|
; CapsLock & F3:: Send, {Volume_Up}                                    ;|
; CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
; CapsLock & F5:: Send, {Media_Next}                                   ;|
; CapsLock & F6:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Window Controller                    ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tag)        ;|
;                     CapsLock + q  |  Ctrl + W   (Close Tag)        ;|
;   (Disabled)  Alt + CapsLock + s  |  AltTab     (Switch Windows)   ;|
;               Alt + CapsLock + q  |  Ctrl + Tab (Close Windows)    ;|
;                     CapsLock + g  |  AppsKey    (Menu Key)         ;|
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


;=====================================================================o
;                        CapsLock Self Defined Area                  ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + d  |  Alt + d(Dictionary)           ;|
;                     CapsLock + f  |  Alt + f(Search via Everything);|
;                     CapsLock + e  |  Open Search Engine            ;|
;                     CapsLock + r  |  Open Shell                    ;|
;                     CapsLock + t  |  Open Text Editor              ;|
;-----------------------------------o---------------------------------o
CapsLock & t:: OpenOrShowAppBasedOnExeName("C:\Users\kiriyuan\AppData\Local\Programs\Microsoft VS Code\Code.exe")               ;|
CapsLock & r:: OpenOrShowAppBasedOnExeName("C:\Program Files\Tencent\WeTERM\WeTERM.exe")               ;|
CapsLock & y:: OpenOrShowAppBasedOnExeName("D:\Soft\XMind_ZEN\XMind.exe")               ;|

CapsLock & x:: 
OpenOrShowAppBasedOnExeName("C:\Program Files\Google\Chrome\Application\chrome.exe")
return

CapsLock & g:: 
OpenOrShowAppBasedOnExeName("C:\Program Files\TencentDocs\TencentDocs.exe")
return

CapsLock & f:: 
Send, #e
return 

CapsLock & a:: Send, ^a                                                ;|
CapsLock & c:: Send, ^c                                                ;|
CapsLock & d:: Send, ^d                                                ;|
CapsLock & e:: Send, ^e                                                ;|
CapsLock & v:: Send, ^v                                                ;|

; CapsLock & r:: Run D:\Soft\XMind_ZEN\XMind.exe                       ;|
; CapsLock & r:: ActivateWindowByProcName("XMind.exe")                 ;|
; CapsLock & t:: Send, !q    ;|
; ---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Char Mapping                       ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + ;  |  Enter (Cancel)                ;|
;                     CapsLock + '  |  =                             ;|
;                     CapsLock + [  |  Back         (Visual Studio)  ;|
;                     CapsLock + ]  |  Goto Define  (Visual Studio)  ;|
;                     CapsLock + /  |  Comment      (Visual Studio)  ;|
;                     CapsLock + \  |  Uncomment    (Visual Studio)  ;|
;                     CapsLock + 1  |  Build and Run(Visual Studio)  ;|
;                     CapsLock + 2  |  Debuging     (Visual Studio)  ;|
;                     CapsLock + 4  |  Step In      (Visual Studio)  ;|
;                     CapsLock + 5  |  Stop Debuging(Visual Studio)  ;|
;                     CapsLock + 6  |  Shift + 6     ^               ;|
;                     CapsLock + 7  |  Shift + 7     &               ;|
;                     CapsLock + 8  |  Shift + 8     *               ;|
;                     CapsLock + 9  |  Shift + 9     (               ;|
;                     CapsLock + 0  |  Shift + 0     )               ;|
;-----------------------------------o---------------------------------o
; CapsLock & `;:: Send, {Enter}                                        ;|
; CapsLock & ':: Send, =                                               ;|
; CapsLock & [:: Send, ^-                                              ;|
; CapsLock & ]:: Send, {F12}                                           ;|
;-----------------------------------o                                ;|
CapsLock & /::                                                       ;|
Send, ^/                                                             ;|
return                                                               ;|

; ---------------------------------------------------------------------o