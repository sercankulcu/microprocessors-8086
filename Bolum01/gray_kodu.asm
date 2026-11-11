; Gray kodu: G = B xor (B >> 1). Gray(11) = 1110b, Gray(12) = 1010b;
; 11 -> 12 geçişinde Gray kodunda yalnız bir bit değişir.
; Kaynak: Bölüm 1.2 Sayı Sistemleri, "Gray Kodu: Kod İzleme"

ORG 100h
MOV AL, 1011b  ; 11
MOV BL, AL
SHR BL, 1      ; B >> 1
XOR BL, AL     ; G
MOV AL, 1100b  ; 12
MOV BH, AL
SHR BH, 1
XOR BH, AL     ; G
RET

; YAZMACLAR: AL BL BH

; Beklenen cikti:
; AL=0Ch
; BL=0Eh
; BH=0Ah
