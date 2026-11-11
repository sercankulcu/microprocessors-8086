; IP nasıl ilerler? Komutlar 3, 3, 1, 2, 1 bayttır: B8 05 00 | BB 02 00 | 40 | 03 C3 | C3.
; IP her komutta uzunluğu kadar ilerler: 0100h, 0103h, 0106h, 0107h, 0109h.
; Kaynak: Bölüm 3.2 Assembly, "IP Nasıl İlerler?"

kod EQU 0100h  ; sunumda yok: BELLEK yönergesi için kodun başı

ORG 100h
MOV AX, 5     ; 3 bayt
MOV BX, 2     ; 3 bayt
INC AX        ; 1 bayt
ADD AX, BX    ; 2 bayt
RET           ; 1 bayt

; YAZMACLAR: AX BX
; BELLEK: kod 10

; Beklenen cikti:
; AX=0008h
; BX=0002h
; kod: B8h 05h 00h BBh 02h 00h 40h 03h C3h C3h
