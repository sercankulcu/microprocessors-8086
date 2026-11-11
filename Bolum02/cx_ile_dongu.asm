; CX ile döngü: 5 + 4 + 3 + 2 + 1 = 15 = 000Fh. Gövde CX = 0 değeriyle çalışmaz.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "CX ile Döngü" (CX ve LOOP: 5 + 4 + 3 + 2 + 1)

org 100h           ; sunumda yok: .COM programı
MOV CX, 5          ; sayaç
MOV AX, 0          ; toplam
TEKRAR: ADD AX, CX
LOOP TEKRAR        ; CX--, ≠0 ise atla
MOV DX, AX         ; sonuç
RET                ; sunumda yok: DOS'a dön

; YAZMACLAR: AX CX DX

; Beklenen cikti:
; AX=000Fh
; CX=0000h
; DX=000Fh
