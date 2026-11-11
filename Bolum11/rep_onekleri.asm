; REP onekiyle blok islemler: REP MOVSB 100 baytlik blogu kopyalar; REP STOSW ekran bellegini
; (B800:0000, 80 x 25 = 2000 sozcuk) bosluk + oznitelik 07h ile doldurur. Sonunda CX = 0,
; DI = 2000 x 2 = 0FA0h. Ekran bosluklarla dolar (bos gorunur).
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "REP Önekleri" (iki parca)
; YAZMACLAR: CX DI ES
; BELLEK: hedef 4

ORG 100h          ; sunumda yok
; 100 baytlık blok kopyalama
cld
lea si, kaynak
lea di, hedef
mov cx, 100
rep movsb

; ekranı boşlukla doldur
mov ax, 0B800h
mov es, ax
xor di, di
mov ax, 0720h   ; ' ' + öznitelik
mov cx, 2000    ; 80×25
rep stosw
ret                     ; sunumda yok
kaynak db 100 dup('K')  ; sunumda yok
hedef  db 100 dup('.')  ; sunumda yok

; Beklenen cikti:
; CX=0000h
; DI=0FA0h
; ES=B800h
; hedef: 4Bh 4Bh 4Bh 4Bh
