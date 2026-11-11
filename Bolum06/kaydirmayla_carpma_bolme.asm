; Kaydırmayla çarpma ve bölme: AX × 3 = AX × 2 + AX; işaretsiz ÷ 8 (SHR) ve kalan (AND 7);
; işaretli ÷ 4 (SAR, -∞'a yuvarlar: -7 → -2). Sunumdaki üç parça bağımsızdır; başlangıç
; değerleri (AX = 5 ve AX = -7) sunumda yok.
; Kaynak: Bölüm 6 sunumu, "Kaydırmayla Çarpma ve Bölme".
; YAZMACLAR: AX BX DX SI
org 100h       ; sunumda yok: .COM programı
mov ax, 5      ; sunumda yok: örnek değer
; AX ← AX × 3 = AX×2 + AX
mov bx, ax     ; sakla
shl ax, 1      ; AX × 2
add ax, bx     ; ×2 + ×1

; işaretsiz ÷ 8 ve kalan
mov dx, ax
and dx, 0007h  ; kalan = alt 3 bit
mov cl, 3
shr ax, cl     ; bölüm
mov si, ax     ; sunumda yok: 15 ÷ 8 bölümünü sakla

; işaretli ÷ 4
mov ax, -7     ; sunumda yok: sunumdaki örnek değer
mov cl, 2
sar ax, cl     ; −7 → −2
ret            ; sunumda yok: programı bitir

; Beklenen cikti:
; AX=FFFEh
; BX=0005h
; DX=0007h
; SI=0001h
