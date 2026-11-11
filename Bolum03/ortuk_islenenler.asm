; Örtük işlenenler: MUL BL çarpılanı AL'den alıp sonucu AX'e yazar (12 x 10 = 120),
; SHR AX, CL kaydırma sayısını CL'den alır (120 / 4 = 30), LOOP CX'i sayar (30 + 3 = 33).
; Kaynak: Bölüm 3.2 Assembly, "Örtük İşlenenler: Kod İzleme"

ORG 100h
MOV AL, 12
MOV BL, 10
MUL BL         ; AX = AL × BL
MOV CL, 2
SHR AX, CL     ; sayı CL'de
MOV CX, 3      ; LOOP sayacı
don:
ADD AX, 1
LOOP don       ; CX azalır
RET

; YAZMACLAR: AX BX CX

; Beklenen cikti:
; AX=0021h
; BX=000Ah
; CX=0000h
