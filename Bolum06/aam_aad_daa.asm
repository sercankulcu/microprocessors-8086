; AAM (6 × 9 = 54 → 0504h), AAD (0702h → 72 = 48h, sonra ÷ 8 = 9) ve DAA (paketli BCD
; 19h + 28h = 41h → 47h).
; Kaynak: Bölüm 6 sunumu, "AAM, AAD ve DAA: Kod İzleme".
; YAZMACLAR: AX AF CF
org 100h         ; sunumda yok: .COM programı
MOV  AL, 6
MOV  BL, 9
MUL  BL          ; AX = 6 × 9
AAM              ; basamaklara ayır
MOV  AX, 0702h   ; '72' paketsiz
AAD              ; ikiliye çevir
MOV  BL, 8
DIV  BL
MOV  AL, 19h     ; paketli 19
ADD  AL, 28h     ; + 28
DAA              ; BCD düzelt
RET

; Beklenen cikti:
; AX=0047h
; AF=1
; CF=0
