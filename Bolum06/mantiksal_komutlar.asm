; AND, OR, XOR ve TEST: harf büyütme/küçültme (bit 5), ASCII rakamı sayıya çevirme,
; tek/çift denetimi ve XOR ile sıfırlama.
; Kaynak: Bölüm 6 sunumu, "Kod İzleme: Mantıksal Komutlar".
; YAZMACLAR: AL BL ZF PF CF OF
org 100h         ; sunumda yok: .COM programı
mov al, 'a'      ; 61h
and al, 0DFh     ; büyük harf
or  al, 20h      ; küçük harf
xor al, 20h      ; tersle
mov bl, '7'      ; 37h
and bl, 0Fh      ; sayı 7
test bl, 1       ; tek mi?
xor bl, bl       ; BL = 0
ret              ; sunumda yok: programı bitir

; Beklenen cikti:
; AL=41h
; BL=00h
; ZF=1
; PF=1
; CF=0
; OF=0
