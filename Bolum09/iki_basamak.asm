; AAM ve PUTC ile iki basamak: 58 -> AH = 5, AL = 8 -> '5', '8'. PUTC AX'i korudugu
; icin iki basamak ayri bir yazmaca kopyalanmadan yazilir.
; Sunum 9.2 "Iki Basamak Yazdirma: Kod Izleme".
ORG  100h
MOV  AL, 58
AAM              ; AH = 5, AL = 8
ADD  AX, 3030h   ; '5', '8'
PUSH AX          ; PUTC AH açılımı
MOV  AL, AH
MOV  AH, 0Eh
INT  10h
POP  AX          ; AX geri: 3538h
PUSH AX          ; PUTC AL açılımı
MOV  AL, AL
MOV  AH, 0Eh
INT  10h
POP  AX
RET

; YAZMACLAR: AX
; Beklenen cikti:
; 58
; AX=3538h
