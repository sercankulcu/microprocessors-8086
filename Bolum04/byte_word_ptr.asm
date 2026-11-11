; byte ptr ve word ptr: ayni sabit (0FFh) bayt ya da sozcuk olarak yazilir; little-endian.
; Sunum 4.1 Bellek Erisimi, slayt "byte ptr ve word ptr" (Kod İzleme).
ORG 100h           ; sunumda yok
MOV BX, 0200h
MOV WORD PTR [BX], 1234h
MOV BYTE PTR [BX], 0FFh
MOV WORD PTR [BX], 0FFh
MOV AX, [BX]        ; sözcük
MOV CL, [BX+1]      ; bayt
RET                ; sunumda yok
ORG 0200h          ; sunumda yok: izlemedeki onceki bellek icerigi (AA BB CC DD)
eski DB 0AAh, 0BBh, 0CCh, 0DDh   ; sunumda yok

; YAZMACLAR: AX CL
; BELLEK: eski 4

; Beklenen cikti:
; AX=00FFh
; CL=00h
; eski: FFh 00h CCh DDh
