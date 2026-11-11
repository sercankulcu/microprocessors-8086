; MyMacro 1, 2, 3 ve MyMacro 4, 5, DX cagrilarinin derleyicinin urettigi acilimi:
; iki cagri 6 komut oldu. Sunum 9.1 "Makro Genisletme" (son acilim), "MyMacro Calisirken".
ORG 100h
MOV AX, 00001h   ; MyMacro 1, 2, 3
MOV BX, 00002h
MOV CX, 00003h
MOV AX, 00004h   ; MyMacro 4, 5, DX
MOV BX, 00005h
MOV CX, DX
RET

; YAZMACLAR: AX BX CX
; Beklenen cikti:
; AX=0004h
; BX=0005h
; CX=0000h
