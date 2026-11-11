; İşaretli sözcükleri CWD ile 32 bite genişletip ADC ile toplamak:
; 30000 + 25000 - 4000 = 51000 = 0000C738h.
; Kaynak: Bölüm 6 sunumu, "CWD ve ADC ile 32 Bitlik Toplam".
; BELLEK: toplam 4
org 100h
jmp basla
dizi dw 30000, 25000, -4000
toplam dw 0, 0       ; 32 bit toplam
basla:
lea si, dizi
mov cx, 3
dongu:
mov ax, [si]
cwd                  ; AX -> DX:AX
add [toplam], ax     ; düşük sözcük
adc [toplam+2], dx   ; yüksek + CF
add si, 2
loop dongu
ret

; Beklenen cikti:
; toplam: 38h C7h 00h 00h
