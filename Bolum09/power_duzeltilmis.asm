; Duzeltilmis POWER: LOCAL etiketler (iki kullanimda Duplicate declaration olmaz),
; JCXZ ile e = 0 -> 1 (LOOP'un 65 536 tur tuzagi yok), BX/CX/DX korunur.
; 7^2 = 49 (0031h) ve 7^0 = 1. Sunum 9.1 "POWER: Tuzaklar".
POWER MACRO b, e, r
      LOCAL p_loop, p_end
      PUSH BX
      PUSH CX
      PUSH DX
      MOV  AX, 1
      MOV  CX, e
      MOV  BX, b
      JCXZ p_end   ; e = 0 → 1
p_loop: MUL BX
      LOOP p_loop
p_end: MOV r, AX
      POP  DX
      POP  CX
      POP  BX
ENDM

ORG 100h                 ; sunumda yok: iki kullanim, veriler kod izleme slaytindan
      MOV  BX, 0AAAh     ; sunumda yok: cagiranin yazmaclari (kod izleme slaytindaki gibi)
      MOV  CX, 0BBBh     ; sunumda yok
      MOV  DX, 0CCCh     ; sunumda yok
      POWER taban, us, sonuc       ; sunumda yok
      POWER taban, sifir, sonuc0   ; sunumda yok: us = 0
      RET                ; sunumda yok
taban  dw 7              ; sunumda yok
us     dw 2              ; sunumda yok
sifir  dw 0              ; sunumda yok
sonuc  dw ?              ; sunumda yok
sonuc0 dw ?              ; sunumda yok

; YAZMACLAR: AX BX CX DX
; BELLEK: sonuc 2
; BELLEK: sonuc0 2
; Beklenen cikti:
; AX=0001h
; BX=0AAAh
; CX=0BBBh
; DX=0CCCh
; sonuc: 31h 00h
; sonuc0: 01h 00h
