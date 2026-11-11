; KAYDIR AX ve KAYDIR BX, 3 acilimi: ayni makro iki farkli uzunlukta kod uretti
; (2 bayt ve 4 bayt). Sunum 9.1 "Kosullu Acilim: Kod Izleme".
org 100h
mov ax, 5
mov bx, 3
shl ax, 1      ; KAYDIR AX
mov cl, 3      ; KAYDIR BX, 3
shl bx, cl
ret

; YAZMACLAR: AX BX CL CF
; Beklenen cikti:
; AX=000Ah
; BX=0018h
; CL=03h
; CF=0
