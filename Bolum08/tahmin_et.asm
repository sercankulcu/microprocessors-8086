; Yığın sırası alıştırması: sonuç AX = 3333h, BX = 1111h, CX = 2222h (4 PUSH, 4 POP).
; Sunum: Bölüm 8 Yığın, slayt "Tahmin Et".
ORG 100h          ; sunumda yok: .COM programı
MOV AX, 1111h
MOV BX, 2222h
MOV CX, 3333h
PUSH AX
PUSH BX
PUSH CX
POP AX
POP CX
PUSH AX
POP BX
POP BX
RET               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=3333h
; BX=1111h
; CX=2222h
