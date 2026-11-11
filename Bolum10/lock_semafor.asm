; LOCK XCHG ile bolunmez oku-degistir-yaz: semafor bos (0) ise alinir, kritik bolgeden sonra
; birakilir. Izlemede bayrak 0110h'dedir; XCHG AL'ye eski degeri (0) verir.
; Kaynak: Bolum 10.1 8086 Pinleri, "LOCK ile Semafor: Kod İzleme"
; YAZMACLAR: AL BX ZF
; BELLEK: bayrak 1

org 100h
mov bx, offset bayrak
bekle: mov al, 1
lock xchg al, [bx]   ; oku + yaz
cmp al, 0            ; boş muydu?
jne bekle            ; doluysa dene
; ... kritik bölge ...
mov byte ptr [bx], 0 ; bırak
ret
bayrak db 0

; Beklenen cikti:
; AL=00h
; BX=0110h
; ZF=1
; bayrak: 00h
