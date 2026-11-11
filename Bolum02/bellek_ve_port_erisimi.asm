; Bellek ve G/Ç erişimi: aynı adres ve veri yolları hem belleğe hem G/Ç portlarına
; gider; ayrımı M/IO' sinyali yapar. MOV belleğe, IN/OUT porta erişir.
; Örnek değerler: 10200h adresinde 5Ah, 51h portunda 3Ch.
; Kaynak: Bölüm 2.1 8086 Mimarisi, "Bellek ve G/Ç Erişimi: Kod İzleme"

hucre EQU 0201h          ; sunumda yok: BELLEK yönergesi için 1000:0201 adresinin adı

org 100h
mov ax, 1000h
mov ds, ax
mov bx, 0200h
mov byte ptr [bx], 5Ah   ; sunumda yok: sunumdaki örnek değer (10200h = 5Ah)
mov al, [bx]     ; bellek oku
out 50h, al      ; G/Ç yaz
in al, 51h       ; G/Ç oku
mov [bx+1], al   ; bellek yaz
ret

; PORT 81: 3Ch
; YAZMACLAR: AL
; BELLEK: hucre 1

; Beklenen cikti (port 50h = 80):
; OUT 80 <- 5Ah
; AL=3Ch
; hucre: 3Ch
