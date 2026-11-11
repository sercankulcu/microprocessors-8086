; Alti adresleme modu: anlik, dogrudan, dolayli, tabanli, taban+indis, taban+indis+d8.
; Sunum 4.1 Bellek Erisimi, slayt "Adresleme Modları: Kod İzleme".
ORG 100h
MOV BX, OFFSET tablo
MOV SI, 2
MOV AH, 7          ; anlık
MOV AL, [tablo+1]  ; doğrudan
MOV CL, [BX]       ; dolaylı
MOV CH, [BX+4]     ; tabanlı
MOV DL, [BX+SI]    ; taban+indis
MOV DH, [BX+SI+3]  ; + d8
RET
tablo DB 11h,22h,33h,44h,55h,66h

; YAZMACLAR: BX SI AX CX DX

; Beklenen cikti:
; BX=0116h
; SI=0002h
; AX=0722h
; CX=5511h
; DX=6633h
