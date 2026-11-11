; PUTC makrosu: karakter yazar, imleci ilerletir; AX korunur. Her kullanim 8 bayt.
; Sunum 9.1 "Ekrana Karakter Yazdirma" (ayni govde ve PUTC 'A' / PUTC 'B' kullanimi
; "Makro Ozellikleri" slaytinda da var).
; karakter yazar, imleci ilerletir
PUTC  MACRO  char
      push  ax
      mov   al, char
      mov   ah, 0eh
      int   10h
      pop   ax
ENDM

ORG  100h
START:
      PUTC  'A'
      PUTC  'B'
      RET

; YAZMACLAR: AX
; Beklenen cikti:
; AB
; AX=0000h
