; PUSH CS + yakın CALL, uzak çağrının yığın düzenini taklit eder; RETF önce IP, sonra CS çeker.
; AX = 5 -> SHL -> 10 -> ADD 1 -> 11 = 000Bh.
; Sunum: Bölüm 8 Prosedürler, slayt "Uzak Dönüş: Kod İzleme".
ORG  100h
MOV  AX, 5
PUSH CS          ; uzak çağrının ilk yarısı
CALL uzak        ; IP itilir
ADD  AX, 1
RET
uzak PROC
SHL  AX, 1
RETF             ; önce IP, sonra CS
uzak ENDP

; YAZMACLAR: AX CS SP
; Beklenen cikti:
; AX=000Bh
; CS=0700h
; SP=0000h
