; SHR ile 2'ye bölme: SHR bölümü verir, düşen bit (kalan) CF'ye gider; RCR kalanı
; BL'ye soldan sokar. 8 turdan sonra BL = 0010 1101b = 2Dh = 45.
; Kaynak: Bölüm 1.2 Sayı Sistemleri, "SHR ile 2'ye Bölme: Kod İzleme"

ORG 100h
MOV AL, 45     ; bölünen
MOV CX, 8      ; 8 bit
bit: SHR AL, 1 ; kalan → CF
RCR BL, 1      ; CF → BL
LOOP bit
RET

; YAZMACLAR: AL BL CX

; Beklenen cikti:
; AL=00h
; BL=2Dh
; CX=0000h
