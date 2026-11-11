; °F → °C: c = (f - 32) × 5 / 9, IMUL ve IDIV ile. 59 °F = 15 °C (AL = 0Fh, kalan AH = 0).
; Kaynak: Bölüm 6 sunumu, "Fahrenhayt → Santigrat".
; YAZMACLAR: AX
org 100h
start:
;fahrenheit to celsius according to: c = (f - 32) * 5 / 9
mov cl, 59
sub cl, 32
mov al, 5
imul cl
mov cl, 9
idiv cl
ret

; Beklenen cikti:
; AX=000Fh
