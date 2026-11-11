; AX akümülatör: AX'i kendisiyle toplamak 2 ile çarpmaktır (5 + 5 = 0Ah).
; Program INT 21h / 4Ch ile biter; AH = 4Ch yazıldığı için AX = 4C0Ah olur.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "AX — Akümülatör"

org 100h       ; sunumda yok: .COM programı
ADD AX, AX     ; AX = AX + AX
MOV AX, 0005h
ADD AX, AX     ; AX = 000Ah
MOV AH, 4Ch    ; DOS: programı bitir
INT 21h

; YAZMACLAR: AX AL

; Beklenen cikti:
; AX=4C0Ah
; AL=0Ah
