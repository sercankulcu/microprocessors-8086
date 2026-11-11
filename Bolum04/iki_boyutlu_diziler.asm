; Ic ice DUP ile iki boyutlu dizi: 3 x 4 bayt = 12 bayt, 3 x 4 sozcuk = 24 bayt.
; Sunum 4.2 Degiskenler, slayt "İki Boyutlu Diziler".
ORG 100h               ; sunumda yok
MOV AX, SIZEOF mat     ; sunumda yok: mat'in bayt sayisi
MOV BX, SIZEOF tab     ; sunumda yok: tab'in bayt sayisi
MOV CX, OFFSET tab - OFFSET mat   ; sunumda yok: tab, mat'in 12 bayt ardinda
RET                    ; sunumda yok
mat DB 3 DUP(4 DUP(0)) ; 3 × 4
tab DW 3 DUP(4 DUP(0)) ; 24 bayt

; YAZMACLAR: AX BX CX

; Beklenen cikti:
; AX=000Ch
; BX=0018h
; CX=000Ch
