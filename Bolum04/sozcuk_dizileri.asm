; DW dizisinde i. elemanin indisi 2 x i'dir; w[1] iki elemanin ortasindan okur.
; Sunum 4.2 Degiskenler, slayt "Sözcük Dizileri".
ORG 100h       ; sunumda yok
MOV AX, w[0]   ; 1. eleman
MOV BX, w[2]   ; 2. eleman
MOV SI, 4
MOV CX, w[SI]  ; 3. eleman
MOV DX, w[1]   ; dikkat!
RET
w DW 1111h, 2222h, 3333h

; YAZMACLAR: AX BX CX DX

; Beklenen cikti:
; AX=1111h
; BX=2222h
; CX=3333h
; DX=2211h
