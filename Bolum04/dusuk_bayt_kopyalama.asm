; 8 bitlik MOV yalniz BL'yi degistirir; BH korunur.
; Sunum 4.1 Bellek Erisimi, slayt "Düşük Baytı Kopyalama".
ORG 100h        ; sunumda yok
MOV AX, 1234h   ; AH = 12h, AL = 34h
MOV BX, 0FFFFh
MOV BL, AL      ; yalnız BL
RET             ; sunumda yok

; YAZMACLAR: AX BX

; Beklenen cikti:
; AX=1234h
; BX=FF34h
