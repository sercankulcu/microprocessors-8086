; °C → °F: f = c × 9 / 5 + 32, IMUL ve IDIV ile. 15 °C = 59 °F (AX = 003Bh).
; Kaynak: Bölüm 6 sunumu, "Santigrat → Fahrenhayt".
; YAZMACLAR: AX CX
org 100h
start:
;celsius to fahrenheit according to f = c * 9 / 5 + 32
mov cl, 15
mov al, 9
imul cl
mov cl, 5
idiv cl
add al, 32
ret

; Beklenen cikti:
; AX=003Bh
; CX=0005h
