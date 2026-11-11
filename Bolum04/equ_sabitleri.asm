; EQU sabiti komuta gomulur ve bellekte yer kaplamaz; v DB 5 ise bellekten okunur.
; Sunum 4.2 Degiskenler, slaytlar "EQU Sabitleri: Kod İzleme" ve "Sabitler (EQU)"
; (ikincisindeki uc MOV bu programin ilk uc komutudur).
k     EQU 5
SATIR EQU 80
ORG 100h
MOV AX, k        ; MOV AX, 5
MOV BX, SATIR*2  ; MOV BX, 160
MOV CL, k+1      ; MOV CL, 6
MOV DL, v        ; bellekten
RET
v DB 5           ; 1 bayt yer

; YAZMACLAR: AX BX CL DL

; Beklenen cikti:
; AX=0005h
; BX=00A0h
; CL=06h
; DL=05h
