; LABEL ayni bellege ikinci bir ad ve tur verir: sozcuk (WORD) ve baytlar (BYTE).
; Sunum 4.2 Degiskenler, slayt "LABEL ile İki Tür: Kod İzleme".
ORG 100h
MOV AX, sozcuk     ; WORD
MOV BL, baytlar    ; düşük
MOV BH, baytlar+1  ; yüksek
MOV baytlar, 0FFh  ; tek bayt
MOV CX, sozcuk     ; sözcük
RET
sozcuk LABEL WORD
baytlar DB 34h, 12h

; YAZMACLAR: AX BX CX
; BELLEK: baytlar 2

; Beklenen cikti:
; AX=1234h
; BX=1234h
; CX=12FFh
; baytlar: FFh 12h
