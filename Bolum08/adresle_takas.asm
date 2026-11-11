; Adresle parametre: takas prosedürü SI ve DI'daki adreslerin içeriğini değiştirir, AX'i korur.
; Sunum: Bölüm 8 Prosedürler, slayt "Adresle Takas: Kod İzleme".
; İzlemedeki gibi a = 0113h, b = 0115h.
ORG  100h
LEA  SI, a
LEA  DI, b
CALL takas
RET
takas PROC        ; Girdi: SI, DI (adres)
PUSH AX
MOV  AX, [SI]
XCHG AX, [DI]
MOV  [SI], AX
POP  AX
RET
takas ENDP
a    DW 1234h
b    DW 00FFh

; YAZMACLAR: AX SI DI
; BELLEK: a 2
; BELLEK: b 2
; Beklenen cikti:
; AX=0000h
; SI=0113h
; DI=0115h
; a: FFh 00h
; b: 34h 12h
