; Yerel değişkenli çerçeve: x = 9 yerelde [BP-2] saklanır, AX = x*x + x = 90 = 005Ah.
; Sunum: Bölüm 8 Prosedürler, slayt "Yerel Değişkenli Çerçeve: Kod İzleme".
ORG  100h        ; sunumda yok: .COM programı
MOV  AX, 9
CALL kare_art    ; AX = x·x + x
RET
kare_art PROC
PUSH BP
MOV  BP, SP
SUB  SP, 2       ; yerel alan [BP-2]
MOV  [BP-2], AX  ; yerel = x
MUL  AX          ; AX = x·x
ADD  AX, [BP-2]  ; + x
MOV  SP, BP      ; yereli at
POP  BP
RET
kare_art ENDP

; YAZMACLAR: AX DX BP
; Beklenen cikti:
; AX=005Ah
; DX=0000h
; BP=0000h
