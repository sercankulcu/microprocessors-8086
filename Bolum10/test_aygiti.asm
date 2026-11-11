; Basit G/C test aygiti: port 110 bayt, port 112 sozcuk. Giris FFh ve 7FFFh:
; INC AL -> 00h (ZF = 1, CF degismez), ADD AX, 1 -> 8000h (OF = 1, SF = 1, CF = 0).
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Test Aygıtı: Kod İzleme"
; ("Test Aygıtı" slaytindaki ayni kod, A7h -> A8h ve 1234h -> 1235h ornegiyle)
; PORT 110: FFh
; PORT 112: 7FFFh
; YAZMACLAR: AX ZF SF OF CF

org 100h
in   al, 110     ; bayt oku
inc  al
out  110, al     ; bayt yaz
in   ax, 112     ; sözcük oku
add  ax, 1
out  112, ax     ; sözcük yaz
ret

; Beklenen cikti:
; OUT 110 <- 00h
; OUT 112 <- 8000h
; AX=8000h
; ZF=0
; SF=1
; OF=1
; CF=0
