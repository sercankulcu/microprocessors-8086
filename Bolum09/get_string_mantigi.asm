; GET_STRING okuma dongusunun sadelestirilmis esdegeri (DX = 4): en fazla DX - 1 = 3
; karakter alinir, tampon 0 ile biter. Kullanici "Ecem" yazar; 4. harf okunmaz.
; Sunum 9.2 "GET_STRING Mantigi: Kod Izleme".
; Slayttaki gibi ad = 011Dh; uc harften sonra DI = 0120h.
ORG  100h        ; sunumda yok
LEA  DI, ad      ; tampon adresi
MOV  DX, 4       ; tampon boyutu
oku: CMP DX, 1   ; 0 için 1 bayt kalsın
JBE  bitti
MOV  AH, 01h
INT  21h         ; AL = tuş (yankılı)
CMP  AL, 13      ; Enter mi?
JE   bitti
MOV  [DI], AL    ; tampona yaz
INC  DI
DEC  DX
JMP  oku
bitti: MOV BYTE PTR [DI], 0
RET
ad   DB 4 DUP(?)

; GIRDI: "Ecem\r"
; YAZMACLAR: DI DX AL
; BELLEK: ad 4
; Beklenen cikti:
; Ece
; DI=0120h
; DX=0001h
; AL=65h
; ad: 45h 63h 65h 00h
