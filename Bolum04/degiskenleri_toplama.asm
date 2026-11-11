; Iki sozcuk degiskeni toplayip ucuncusune yazma: 105h + 103h = 208h.
; Sunum 4.2 Degiskenler, slayt "Değişkenleri Toplama".
ORG 100h        ; sunumda yok: slaytta ORG yok
jmp start
value1 DW 105h  ; ilk değer 105h
value2 DW 103h  ; ilk değer 103h
result DW ?     ; belirsiz
start:
MOV AX, value1  ; AX ← value1
ADD AX, value2  ; AX ← AX + value2
MOV result, AX  ; result ← AX
RET             ; sunumda yok: slaytta program burada bitmiyor
end start

; YAZMACLAR: AX CF ZF PF
; BELLEK: result 2

; Beklenen cikti:
; AX=0208h
; CF=0
; ZF=0
; PF=0
; result: 08h 02h
