; INT 21h AH = 01h ile yansıtmalı karakter okumak, AH = 02h ile CR, LF ve sonraki harfi yazmak.
; Kaynak: Bölüm 5.2 sunumu, "İz: AH = 01h / 02h".
; GIRDI: "a"
org 100h
mov ah, 01h      ; oku + yansıt
int 21h          ; AL = karakter
mov bl, al       ; sakla
mov ah, 02h      ; karakter yaz
mov dl, 0Dh      ; CR: satır başı
int 21h
mov dl, 0Ah      ; LF: alt satır
int 21h
inc bl           ; sonraki harf
mov dl, bl
int 21h
ret

; Beklenen cikti:
; a
; b
