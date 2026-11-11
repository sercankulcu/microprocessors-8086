; PUSHF / POPF: ilk toplamanın bayrakları (CF = 1, ZF = 1) saklanır, ikinci toplamadan
; sonra geri yüklenir.
; Sunum: Bölüm 8 Yığın, slayt "PUSHF / POPF".
ORG   100h
MOV   AX, 0FFFFh
ADD   AX, 1      ; CF=1, ZF=1
PUSHF            ; bayrakları sakla
MOV   BX, 5
ADD   BX, 3      ; CF=0, ZF=0
POPF             ; bayraklar geri
RET

; YAZMACLAR: AX BX CF ZF
; Beklenen cikti:
; AX=0000h
; BX=0008h
; CF=1
; ZF=1
