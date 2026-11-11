; Parametre bloğu: BX bloğun adresini taşır; hesap a * b + c = 12 * 7 + 5 = 89 = 0059h
; sonucunu bloğun dördüncü sözcüğüne yazar, AX ve DX'i korur.
; Sunum: Bölüm 8 Prosedürler, slayt "Parametre Bloğu".
ORG  100h         ; sunumda yok: .COM programı
LEA  BX, blok
CALL hesap        ; sonuç = a × b + c
RET
hesap PROC        ; Girdi: BX = blok adresi
PUSH AX
PUSH DX           ; MUL DX'i de yazar
MOV  AX, [BX]     ; a
MUL  WORD PTR [BX+2] ; × b
ADD  AX, [BX+4]   ; + c
MOV  [BX+6], AX   ; sonuç
POP  DX
POP  AX
RET
hesap ENDP
blok DW 12, 7, 5, ?

; YAZMACLAR: AX DX
; BELLEK: blok 8
; Beklenen cikti:
; AX=0000h
; DX=0000h
; blok: 0Ch 00h 07h 00h 05h 00h 59h 00h
