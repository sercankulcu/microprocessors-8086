; Özyinelemeli yazdırma: yaz, AX'i 10'a bölüp basamağı yığına iter, önce üst basamakları
; kendini çağırarak yazar. 472 -> ekranda 472.
; Sunum: Bölüm 8 Prosedürler, slayt "Özyinelemeli Yazdırma: Kod İzleme".
ORG  100h
MOV  AX, 472
CALL yaz
RET
yaz PROC         ; Girdi: AX (işaretsiz)
XOR  DX, DX
MOV  BX, 10
DIV  BX          ; AX = bölüm, DX = basamak
PUSH DX
OR   AX, AX      ; başka basamak var mı?
JZ   son
CALL yaz         ; önce üst basamaklar
son: POP AX
ADD  AL, '0'
MOV  AH, 0Eh
INT  10h
RET
yaz ENDP

; YAZMACLAR: AX DX
; Beklenen cikti:
; 472
; AX=0E32h
; DX=0004h
