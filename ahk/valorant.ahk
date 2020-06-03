
; --- quick comms ------------------------------------------------------------------------
; Be quiet
^+P::
SetKeyDelay, 100
Send, . 
Send, 2 
Send, 3 
return

; Going A
^![::
SetKeyDelay, 100
Send, . 
Send, 4 
Send, 2 
return

; Going B
^!]::
SetKeyDelay, 100
Send, . 
Send, 4 
Send, 3 
return

; Going C
^!'::
SetKeyDelay, 100
Send, . 
Send, 4 
Send, 4 
return

; YES
^!{::
SetKeyDelay, 100
Send, . 
Send, 3 
Send, 3 
return

; NO
^!}::
SetKeyDelay, 100
Send, . 
Send, 3 
Send, 4 
return