; 32 × 32 bit çarpma: dört 16 × 16 kısmi çarpım (MUL) ADD/ADC ile 64 bitlik sonuca toplanır.
; 9ABCDEF0h × EDCBFEDCh = 8FBC283557D1B640h (bellekte küçük uçlu).
; Kaynak: Bölüm 6 sunumu, "32 × 32 Bit Çarpma: Kod İzleme".
; BELLEK: z 8
org 100h
mov ax, [x]       ; A0
mul [y]           ; A0*B0
mov [z], ax
mov [z+2], dx
mov ax, [x+2]     ; A1
mul [y]           ; A1*B0
add [z+2], ax
adc [z+4], dx
mov ax, [x]       ; A0
mul [y+2]         ; A0*B1
add [z+2], ax
adc [z+4], dx
adc [z+6], 0
mov ax, [x+2]     ; A1
mul [y+2]         ; A1*B1
add [z+4], ax
adc [z+6], dx
ret
x dw 0DEF0h, 9ABCh  ; A = 9ABCDEF0h
y dw 0FEDCh, 0EDCBh ; B = EDCBFEDCh
z dw 4 dup(0)       ; 64 bit sonuç

; Beklenen cikti:
; z: 40h B6h D1h 57h 35h 28h BCh 8Fh
