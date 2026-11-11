; Aynı sırayla PUSH ve POP: üstteki CX, AX'e; alttaki AX, CX'e gelir. AX ile CX yer değiştirir.
; Sunum: Bölüm 8 Yığın, slayt "Yığın Kullanımı" (sunumda .BIN olarak yüklenir; burada .COM).
org 100h          ; sunumda yok: .COM programı
mov ax, 2
mov bx, 4
mov cx, 8
push ax
push bx
push cx
pop  ax
pop  bx
pop  cx
ret               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=0008h
; BX=0004h
; CX=0002h
