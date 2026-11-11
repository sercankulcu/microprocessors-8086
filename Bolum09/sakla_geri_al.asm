; Yazmac saklama makrolari: SAKLA dort yazmaci yigina iter, GERI_AL ters sirayla ceker.
; Sunum 9.1 "Yazmac Saklama Makrolari" (tanimlar; deneme kullanimi eklendi).

SAKLA MACRO
  PUSH AX
  PUSH BX
  PUSH CX
  PUSH DX
ENDM

GERI_AL MACRO
  POP DX
  POP CX
  POP BX
  POP AX
ENDM

ORG 100h                 ; sunumda yok: deneme kullanimi
MOV  AX, 1111h           ; sunumda yok
MOV  BX, 2222h           ; sunumda yok
MOV  CX, 3333h           ; sunumda yok
MOV  DX, 4444h           ; sunumda yok
SAKLA
XOR  AX, AX              ; sunumda yok: yazmaclari boz
XOR  BX, BX              ; sunumda yok
XOR  CX, CX              ; sunumda yok
XOR  DX, DX              ; sunumda yok
GERI_AL
RET                      ; sunumda yok

; YAZMACLAR: AX BX CX DX
; Beklenen cikti:
; AX=1111h
; BX=2222h
; CX=3333h
; DX=4444h
