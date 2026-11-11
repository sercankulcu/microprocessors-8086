; 0 ile biten dizgiyi yerinde buyuk harfe cevirme: yalniz 'a'..'z' arasindan 20h cikarilir.
; Sunum 4.2 Degiskenler, slayt "Büyük Harfe Çevirme: Kod İzleme".
; Izlemedeki gibi s = 0119h; sonlandiricida SI = 011Dh.
ORG 100h
LEA SI, s
don:
MOV AL, [SI]
CMP AL, 0          ; sonlandırıcı?
JE bitti
CMP AL, 'a'
JB sonraki
CMP AL, 'z'
JA sonraki
SUB AL, 20h        ; 'a' - 'A'
MOV [SI], AL
sonraki:
INC SI
JMP don
bitti:
RET
s DB 'Ab1c', 0

; YAZMACLAR: AL SI ZF
; BELLEK: s 5

; Beklenen cikti:
; AL=00h
; SI=011Dh
; ZF=1
; s: 41h 42h 31h 43h 00h
