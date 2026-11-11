; XCHG iki yazmaci tek komutta takas eder.
; Sunum 4.1 Bellek Erisimi, slayt "XCHG: Takas".
ORG 100h     ; sunumda yok
MOV CX, 10   ; CX = 000Ah
MOV DX, 20   ; DX = 0014h
XCHG CX, DX  ; takas
RET          ; sunumda yok

; YAZMACLAR: CX DX

; Beklenen cikti:
; CX=0014h
; DX=000Ah
