; PRINT_NUM ve eksi isareti: OR AX, AX isaret bitini SF'ye koyar; negatifse NEG ile
; mutlak deger alinir ve once '-' yazilir. AX yazdirildiktan sonra da FFE7h'dir.
; Sunum 9.2 "PRINT_NUM ve Eksi Isareti: Kod Izleme".
include 'emu8086.inc'    ; sunumda yok: print_num_uns icin
ORG  100h
MOV  AX, -25       ; AX = FFE7h
CALL print_num
RET
print_num PROC
PUSH AX
OR   AX, AX        ; SF = işaret biti
JNS  pozitif
NEG  AX            ; AX = 0019h
PUSH AX            ; PUTC '-' açılımı
MOV  AL, '-'
MOV  AH, 0Eh
INT  10h
POP  AX
pozitif: CALL print_num_uns
POP  AX            ; AX = FFE7h geri
RET
print_num ENDP
DEFINE_PRINT_NUM_UNS     ; sunumda yok: cagrilan prosedur kutuphaneden

; YAZMACLAR: AX
; Beklenen cikti:
; -25
; AX=FFE7h
