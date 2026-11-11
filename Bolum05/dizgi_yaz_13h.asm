; INT 10h AH = 13h ile dizgi yazmak: dizgi ES:BP'de, AL = 01h imleci dizginin sonuna taşır.
; Kaynak: Bölüm 5.2 sunumu, "AH = 13h: Dizgi Yaz".
; YAZMACLAR: BP
org 100h
mov ax, 1301h    ; AH=13h, AL=01h
mov bx, 001Eh    ; BH=0, BL=1Eh
mov cx, 7        ; dizgi uzunluğu
mov dx, 0205h    ; satır 2, sütun 5
lea bp, mesaj    ; ES:BP → dizgi
int 10h
ret
mesaj db 'Merhaba'

; Beklenen cikti:
;
;
;      Merhaba
; BP=0112h
