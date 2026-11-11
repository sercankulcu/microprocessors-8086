; Parametre deger degil metindir: ALAN 2+3, 4 -> MOV AX, 2+3*4 = 14 (beklenen 20 idi).
; Govdede parantez kullanilinca (2+3)*(4) = 20. FARK 10, 4+1 -> MOV CX, 10-4+1 = 7.
; Sunum 9.1 "Parametre Ifadeleri ve Oncelik" (tanimlar; cagrilar slayttaki tablodan).

ALAN MACRO en, boy
  MOV AX, en*boy
ENDM

FARK MACRO p, q
  MOV CX, p-q
ENDM

ALAN_P MACRO en, boy     ; sunumda yok: tablodaki "duzeltilmis ALAN" (parantezli govde)
  MOV AX, (en)*(boy)
ENDM

ORG 100h                 ; sunumda yok: cagrilar slayttaki tablodan
ALAN 2+3, 4
MOV BX, AX               ; sunumda yok: ilk sonucu sakla
ALAN_P 2+3, 4
FARK 10, 4+1
RET                      ; sunumda yok

; YAZMACLAR: BX AX CX
; Beklenen cikti:
; BX=000Eh
; AX=0014h
; CX=0007h
