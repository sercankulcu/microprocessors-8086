; Konum sayaci: n EQU $ - s dizginin bayt sayisi; TYPE, LENGTHOF, SIZEOF ayni bilgiyi tanimdan okur.
; Sunum 4.2 Degiskenler, slayt "Konum Sayacı ve Boyut İşleçleri" (slayttaki tablo degerleri).
ORG 100h             ; sunumda yok
MOV CX, n            ; sunumda yok: 8
MOV AL, TYPE s       ; sunumda yok: 1
MOV AH, LENGTHOF s   ; sunumda yok: 8
MOV BL, TYPE w       ; sunumda yok: 2
MOV BH, LENGTHOF w   ; sunumda yok: 10
MOV DX, SIZEOF w     ; sunumda yok: 20
RET                  ; sunumda yok
s DB 'Merhaba', 0
n EQU $ - s        ; 8
w DW 10 DUP(0)

; YAZMACLAR: CX AX BX DX

; Beklenen cikti:
; CX=0008h
; AX=0801h
; BX=0A02h
; DX=0014h
