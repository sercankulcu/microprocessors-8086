; INT 21h AH = 0Ah ile tamponlu satır okumak, sondaki CR'nin yerine '$' koyup AH = 09h ile
; yazdırmak. Sunumdaki gibi kullanıcı Ali yazıp Enter'a basar.
; Kaynak: Bölüm 5.2 sunumu, "İz: AH = 0Ah".
; GIRDI: "Ali\r"
; BELLEK: tampon 6
org 100h
mov dx, offset tampon
mov ah, 0Ah          ; tamponlu giriş
int 21h
mov bl, [tampon+1]   ; okunan sayı
mov bh, 0
mov byte ptr tampon[bx+2], '$'
mov dx, offset selam
mov ah, 09h
int 21h
lea dx, [tampon+2]
int 21h
ret
tampon db 10, ?, 10 dup(?)
selam  db 0Dh, 0Ah, 'Merhaba $'

; Beklenen cikti:
; Ali
; Merhaba Ali
; tampon: 0Ah 03h 41h 6Ch 69h 24h
