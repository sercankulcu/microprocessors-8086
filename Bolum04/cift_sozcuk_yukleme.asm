; 32 bitlik degiskeni DX:AX'e yukleme: word ptr data (dusuk) ve word ptr [data+2] (yuksek).
; Sunum 4.2 Degiskenler, slayt "Çift Sözcük Yükleme".
ORG 100h        ; sunumda yok
mov ax, word ptr data      ; data+0
mov dx, word ptr [data+2]  ; data+2
ret
data dd 12345678h

; YAZMACLAR: DX AX

; Beklenen cikti:
; DX=1234h
; AX=5678h
