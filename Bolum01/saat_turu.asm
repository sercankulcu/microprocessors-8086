; Bir döngü kaç saat turu sürer? Her komutun yanında 8086 tur sayısı yazılı.
; Toplam 4 + 4 + 4*3 + 3*17 + 5 + 2 = 78 tur; 5 MHz'de 78 x 200 ns = 15,6 us.
; Kaynak: Bölüm 1.1 Giriş, "Döngünün Süresi: Saat Turu Sayımı"

org 100h
mov cx, 4        ; 4 tur
mov ax, 0        ; 4 tur
dongu: add ax, cx ; 3 tur
loop dongu       ; 17 / 5 tur
hlt              ; 2 tur

; YAZMACLAR: AX CX

; Beklenen cikti:
; AX=000Ah
; CX=0000h
