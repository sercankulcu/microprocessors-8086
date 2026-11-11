; Sozcuk dizisinde indis bayt uzakligidir: dizi[1] (SI = 1) iki elemanin ortasini okur;
; dogrusu SI = indis x 2 (shl si, 1).
; Sunum 4.1 Bellek Erisimi, slayt "Sözcük Dizisinde İndis: Kod İzleme".
org 100h
mov si, 1            ; indis 1
mov ax, dizi[si]     ; HATA!
shl si, 1            ; indis × 2
mov bx, dizi[si]     ; dizi[1]
mov si, 2            ; indis 2
shl si, 1            ; SI = 4
mov cx, dizi[si]     ; dizi[2]
ret
dizi dw 1234h, 5678h, 9ABCh

; YAZMACLAR: AX BX CX SI

; Beklenen cikti:
; AX=7812h
; BX=5678h
; CX=9ABCh
; SI=0004h
