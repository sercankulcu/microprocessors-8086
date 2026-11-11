; INT 21h AH = 2Ah ile haftanın gününü (AL = 0…6) alıp 4 baytlık tablo kaydından gün adını
; yazdırmak. Deneme ortamının tarihi 1 Ocak 2026, Perşembe (AL = 4).
; Kaynak: Bölüm 5.2 sunumu, "Tarih ve Saat" ve "Gün Adını Yazdır: Kod İzleme".
org 100h
mov ah, 2Ah
int 21h          ; AL = 0…6
mov ah, 0
mov bl, 4
mul bl           ; AX = AL × 4
mov dx, offset gunler
add dx, ax
mov ah, 09h
int 21h
ret
gunler db 'Paz$Pzt$Sal$Car$'
       db 'Per$Cum$Cmt$'

; Beklenen cikti:
; Per
