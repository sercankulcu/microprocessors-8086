; XCHG yazmac <-> bellek ve XCHG'siz uc MOV'lu takas (yardimci yazmac AX) ile karsilastirma.
; Sunum 4.1 Bellek Erisimi, slayt "XCHG ve Bellek: Kod İzleme"
; (uc MOV'lu takas "XCHG Kuralları" slaytindakiyle ayni).
ORG 100h
MOV SI, OFFSET sayi
MOV AL, 5Ah
XCHG AL, [SI]      ; AL ↔ [SI]
MOV CX, 1111h
MOV DX, 2222h
MOV AX, CX         ; yedek
MOV CX, DX
MOV DX, AX         ; takas
XCHG CX, DX        ; tek komut
RET
sayi DB 0A5h

; YAZMACLAR: SI AX CX DX
; BELLEK: sayi 1

; Beklenen cikti:
; SI=0116h
; AX=1111h
; CX=1111h
; DX=2222h
; sayi: 5Ah
