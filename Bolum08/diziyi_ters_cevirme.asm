; Yığınla diziyi ters çevirme: 'A', 'B', 'C' sırayla itilir, ters sırada çekilip yazılır.
; Sunum: Bölüm 8 Yığın, slayt "Örnek: Diziyi Ters Çevirme".
ORG  100h
MOV  SI, OFFSET metin
MOV  CX, 3
koy: MOV  AL, [SI]
     PUSH AX       ; karakteri sakla
     INC  SI
     LOOP koy
MOV  CX, 3
yaz: POP  DX       ; DL = karakter
     MOV  AH, 2
     INT  21h      ; DL'yi ekrana yaz
     LOOP yaz
RET
metin DB 'ABC'   ; 0117h

; metin 0117h'de olduğundan döngüden sonra SI = 011Ah.
; YAZMACLAR: SI DX
; BELLEK: metin 3
; Beklenen cikti:
; CBA
; SI=011Ah
; DX=0041h
; metin: 41h 42h 43h
