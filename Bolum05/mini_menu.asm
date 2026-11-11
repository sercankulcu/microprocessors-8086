; Mini menü: menüyü AH = 09h ile yaz, AH = 01h ile seçimi oku; '1' selam verir, 'q' çıkar
; (INT 21h AH = 4Ch, çıkış kodu 0). Sunumdaki gibi önce 1, sonra q.
; Kaynak: Bölüm 5.2 sunumu, "İz: Mini Menü".
; GIRDI: "1q"
org 100h
goster:
mov dx, offset menu
mov ah, 09h
int 21h
mov ah, 01h       ; seçimi oku
int 21h
cmp al, 'q'
je cikis
cmp al, '1'
jne goster
mov dx, offset selam
mov ah, 09h
int 21h
jmp goster
cikis:
mov ax, 4C00h     ; çıkış kodu 0
int 21h
menu  db 0Dh, 0Ah, '1:Selam q:Cikis $'
selam db 0Dh, 0Ah, 'Selam!$'

; Beklenen cikti:
;
; 1:Selam q:Cikis 1
; Selam!
; 1:Selam q:Cikis q
