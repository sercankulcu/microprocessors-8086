; Yığın çerçevesi kalıbı: BP çerçeve noktası, SUB SP ile yerel alan, MOV SP, BP ile bırakma,
; RET 4 ile iki parametreyi çağrılanın atması. Yığın dengeli kalır.
; Sunum: Bölüm 8 Prosedürler, slayt "Yığın Çerçevesi".
ORG  100h         ; sunumda yok: .COM programı
PUSH AX           ; sunumda yok: 1. parametre
PUSH AX           ; sunumda yok: 2. parametre
MOV  AX, 7        ; sunumda yok
CALL cerceve      ; sunumda yok
RET               ; sunumda yok: DOS'a dönüş (RET 4 parametreleri atmasaydı yanlış adrese dönerdi)
cerceve PROC      ; sunumda yok
PUSH BP
MOV  BP, SP
SUB  SP, 4        ; yerel alan
MOV  [BP-2], AX   ; yerel 1
; ...
MOV  SP, BP       ; yerelleri at
POP  BP
RET  4            ; 2 parametreyi at
cerceve ENDP      ; sunumda yok

; YAZMACLAR: AX BP SP
; Beklenen cikti:
; AX=0007h
; BP=0000h
; SP=0000h
