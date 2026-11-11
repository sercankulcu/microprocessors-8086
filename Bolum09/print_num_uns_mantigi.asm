; PRINT_NUM_UNS ile ayni ciktiyi veren yiginli yontem: 10'a bol, kalani yigina it,
; ters sirayla cekip yaz. AX = 1205 -> ekranda 1205.
; Sunum 9.2 "PRINT_NUM_UNS Mantigi: Kod Izleme".
ORG  100h
MOV  AX, 1205    ; yazdırılacak sayı
MOV  BX, 10
XOR  CX, CX      ; basamak sayacı
bol: XOR DX, DX
DIV  BX          ; AX=bölüm, DX=kalan
PUSH DX          ; basamak yığına
INC  CX
OR   AX, AX      ; bölüm 0 mı?
JNZ  bol
yaz: POP AX      ; önce en anlamlı
ADD  AL, '0'
MOV  AH, 0Eh
INT  10h
LOOP yaz
RET

; YAZMACLAR: AX CX DX
; Beklenen cikti:
; 1205
; AX=0E35h
; CX=0000h
; DX=0001h
