; SCAN_NUM'un ozu: rakamlar soldan saga okunur, sonuc = sonuc x 10 + rakam; sonuc CX'te.
; Girdi 307 -> CX = 0133h. Sunum 9.2 "SCAN_NUM Mantigi: Kod Izleme".
ORG  100h
XOR  CX, CX      ; sonuç = 0
oku: MOV AH, 01h
INT  21h         ; AL = tuş (yankılı)
CMP  AL, 13      ; Enter mi?
JE   bitti
SUB  AL, '0'     ; ASCII → rakam
CBW              ; AX = rakam
XCHG AX, CX      ; AX=sonuç, CX=rakam
MOV  BX, 10
MUL  BX          ; AX = sonuç × 10
ADD  CX, AX      ; CX = sonuç×10 + rakam
JMP  oku
bitti: RET

; GIRDI: "307\r"
; YAZMACLAR: CX AX BX ZF
; Beklenen cikti:
; 307
; CX=0133h
; AX=010Dh
; BX=000Ah
; ZF=1
