; Kesim oneki: ES:[BX] video bellegini, [BX] DS'yi, SS:[SI] yigin kesimini okur.
; Sunum 4.1 Bellek Erisimi, slayt "Kesim Öneki".
; .COM'da DS = PSP kesimi: DS:0000'da INT 20h komutu (CD 20) vardir, AL = CDh.
ORG 100h            ; sunumda yok
MOV AX, 0B800h
MOV ES, AX          ; ES = video belleği
MOV BX, 0
MOV AL, ES:[BX]     ; ES:0000'dan oku
MOV AL, [BX]        ; DS:0000'dan oku
MOV DL, SS:[SI]     ; SS:SI'dan oku
RET                 ; sunumda yok

; YAZMACLAR: ES AL

; Beklenen cikti:
; ES=B800h
; AL=CDh
