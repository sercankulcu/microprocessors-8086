; AAA: paketsiz BCD toplamadan sonra düzeltme. 9 + 5 = 0Eh → AH = 1, AL = 4: "14".
; Kaynak: Bölüm 6 sunumu, "AAA: Toplama Sonrası Düzeltme".
; YAZMACLAR: AX
org 100h        ; sunumda yok: .COM programı
; first number '9':
mov     ah, 09h
; second number '5':
mov     al, 05h
; al = al + ah = 09h + 05h = 0eh
add     al, ah
; clear tens byte of bcd
xor     ah, ah
; adjust result to bcd form, ah = 1, al = 4 -> '14'
aaa
; --- sonucu yazdır (ek) ---
or      ax, 3030h   ; ASCII'ye çevir
mov     bl, al      ; '4' sakla
mov     al, ah      ; '1'
mov     ah, 0Eh
int     10h
mov     al, bl
int     10h
ret

; Beklenen cikti:
; 14
; AX=0E34h
