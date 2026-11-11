; Ikili (b), onaltilik (h) ve sekizli (o) sabitlerle atama ve toplama/cikarma.
; Sunum 4.1 Bellek Erisimi, slayt "Sayı Tabanlarıyla Atama".
ORG 100h          ; sunumda yok
mov al, 00000101b ; ikili
mov bl, 0ah       ; onaltılık
mov cl, 10o       ; sekizli
add al, bl        ; 5 + 10 = 15
sub al, cl        ; 15 - 8 = 7
RET               ; sunumda yok

; YAZMACLAR: AL BL CL CF PF

; Beklenen cikti:
; AL=07h
; BL=0Ah
; CL=08h
; CF=0
; PF=0
