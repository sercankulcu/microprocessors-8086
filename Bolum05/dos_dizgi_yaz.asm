; INT 21h AH = 09h ile '$' ile biten dizgileri yazdırmak; AH ikinci çağrıda hâlâ 09h.
; Kaynak: Bölüm 5.2 sunumu, "İz: AH = 09h".
org 100h
mov dx, offset msg1   ; DS:DX → dizgi
mov ah, 09h
int 21h
mov dx, offset msg2
int 21h               ; AH hâlâ 09h
ret
msg1 db 'Merhaba, 8086!', 0Dh, 0Ah, '$'
msg2 db 'Gule gule$'

; Beklenen cikti:
; Merhaba, 8086!
; Gule gule
