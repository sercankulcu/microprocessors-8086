; 8 bitlik toplamada elde komsu bayta gecmez; 16 bitlik toplamada gecer.
; Sunum 4.1 Bellek Erisimi, slayt "Yüksek Bayta Ekleme".
; Ara adim (ADD AL, 01h sonrasi): AX = 0100h, CF = 1, ZF = 1.
ORG 100h        ; sunumda yok
MOV AX, 00FFh   ; AH = 00h, AL = FFh
ADD AH, 01h     ; yalnız AH
ADD AL, 01h     ; yalnız AL
MOV AX, 01FFh
ADD AX, 1       ; 16 bit
RET             ; sunumda yok

; YAZMACLAR: AX CF ZF SF OF PF AF

; Beklenen cikti:
; AX=0200h
; CF=0
; ZF=0
; SF=0
; OF=0
; PF=1
; AF=1
