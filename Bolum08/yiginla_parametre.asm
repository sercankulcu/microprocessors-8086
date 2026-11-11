; Yığınla parametre geçirme: çağıran iki parametreyi iter, TOPLA bunları BP üzerinden okur
; ([BP+6] = 7, [BP+4] = 3), çağıran ADD SP, 4 ile atar. Sonuç AX = 10.
; Sunum: Bölüm 8 Prosedürler, slayt "Yığınla Parametre Geçirme".
ORG  100h
MOV  AX, 7
PUSH AX          ; 1. parametre
MOV  AX, 3
PUSH AX          ; 2. parametre
CALL TOPLA
ADD  SP, 4       ; parametreleri at
RET
TOPLA PROC
PUSH BP
MOV  BP, SP
MOV  AX, [BP+6]  ; 1. parametre
ADD  AX, [BP+4]  ; 2. parametre
POP  BP
RET
TOPLA ENDP

; YAZMACLAR: AX BP SP
; Beklenen cikti:
; AX=000Ah
; BP=0000h
; SP=0000h
