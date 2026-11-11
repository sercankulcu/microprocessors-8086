; Makro ve prosedur birlikte: YAZ_RAKAM MACRO d / mov al, d / call rakam_yaz / ENDM.
; Makro parametreyi yazmaca koyar, ortak is tek kopya prosedurde. Asagidaki kod iki
; cagrinin (YAZ_RAKAM 4, YAZ_RAKAM 7) acilmis halidir.
; Sunum 9.1 "Makro ve Prosedur Birlikte: Kod Izleme".
org 100h
mov  al, 4       ; YAZ_RAKAM 4
call rakam_yaz
mov  al, 7       ; YAZ_RAKAM 7
call rakam_yaz
ret
rakam_yaz:
add  al, '0'     ; rakam → ASCII
mov  ah, 0Eh
int  10h
ret

; YAZMACLAR: AL
; Beklenen cikti:
; 47
; AL=37h
