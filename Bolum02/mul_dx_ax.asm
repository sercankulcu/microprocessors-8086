; MUL ile DX:AX: 16 bitlik MUL sonucu DX:AX'e (1234h x 0100h = 00123400h), 8 bitlik
; MUL sonucu AX'e yazar (FFh x 2 = 01FEh; DX değişmez). Ardından DX port numarası
; olur: AL = FEh, 03F8h (COM1) portuna gönderilir.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "MUL ile DX:AX"

org 100h        ; sunumda yok: .COM programı
MOV AX, 1234h
MOV BX, 0100h
MUL BX          ; DX:AX = AX*BX
MOV AX, 00FFh
MOV BL, 2
MUL BL          ; AX = AL*BL
MOV DX, 03F8h   ; port adresi
OUT DX, AL      ; porta yaz
RET             ; sunumda yok: DOS'a dön

; YAZMACLAR: AX BX DX CF OF

; Beklenen cikti (port 03F8h = 1016):
; OUT 1016 <- FEh
; AX=01FEh
; BX=0102h
; DX=03F8h
; CF=1
; OF=1
