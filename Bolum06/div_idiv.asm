; DIV, CWD ve IDIV: 2000 / 9 = 222 kalan 2; -2000 / 9 = -222 kalan -2.
; Sunumdaki son iki komut bilerek hatalıdır: DX = FFFEh temizlenmeden yapılan DIV BX'te
; bölüm 16 bite sığmaz ve işlemci INT 0 üretir. Program durmasın diye o iki satır yorumda.
; Kaynak: Bölüm 6 sunumu, "DIV ve IDIV: Kod İzleme".
; YAZMACLAR: AX DX
org 100h         ; sunumda yok: .COM programı
MOV  AX, 2000
XOR  DX, DX      ; DX:AX = 2000
MOV  BX, 9
DIV  BX          ; işaretsiz bölme
MOV  AX, -2000
CWD              ; işaret genişlet
IDIV BX          ; işaretli bölme
; MOV  AX, 2000    ; DX temizlenmedi!
; DIV  BX          ; HATA: DX:AX = FFFE07D0h, bölüm sığmaz → INT 0
; Doğrusu:
; MOV  AX, 2000
; XOR  DX, DX
; DIV  BX
RET

; Beklenen cikti:
; AX=FF22h
; DX=FFFEh
