; Degisken tanimi: DB bir bayt, DW bir sozcuk (little-endian).
; Sunum 4.2 Degiskenler, slayt "Değişkenler".
ORG 100h           ; sunumda yok
RET                ; sunumda yok
counter DB 10h     ; BYTE
sum     DW 0FFFFh  ; WORD

; BELLEK: counter 1
; BELLEK: sum 2

; Beklenen cikti:
; counter: 10h
; sum: FFh FFh
