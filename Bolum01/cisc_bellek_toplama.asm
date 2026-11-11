; Tek CISC komutu, üç iş: ADD [BX], AX belleği okur, toplar ve geri yazar.
; sayi = 0123h -> 012Ah -> 0131h
; Kaynak: Bölüm 1.1 Giriş, "CISC Komutu İçeride: Kod İzleme"
; (aynı komut "CISC" ve "CISC ve RISC Örneği" slaytlarında da geçer)

org 100h
mov bx, offset sayi ; adres
mov ax, 7           ; değer
add [bx], ax        ; oku, topla, yaz
add [bx], ax        ; tekrar
ret
sayi dw 0123h

; YAZMACLAR: BX AX
; BELLEK: sayi 2

; Beklenen cikti:
; BX=010Bh
; AX=0007h
; sayi: 31h 01h
