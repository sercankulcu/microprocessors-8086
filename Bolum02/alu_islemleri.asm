; ALU işlemleri: toplama, 8 bitlik çıkarma, MUL, DIV, AND maskesi ve XOR ile sıfırlama.
; AX: 0040h -> 003Bh -> 00ECh -> 004Eh (kalan DX = 2) -> 000Eh -> 0000h
; Kaynak: Bölüm 2.1 8086 Mimarisi, "ALU İşlemleri: Kod İzleme"

org 100h
mov ax, 0010h
mov bx, 0030h
add ax, bx      ; AX ← AX + BX
sub al, 5       ; AL ← AL − 5
mov bl, 4
mul bl          ; AX ← AL × BL
mov dx, 0
mov cx, 3
div cx          ; AX ← DX:AX ÷ CX
and al, 0Fh     ; üst 4 biti sil
xor ax, ax      ; AX ← 0
ret

; YAZMACLAR: AX BX CX DX CF ZF

; Beklenen cikti:
; AX=0000h
; BX=0004h
; CX=0003h
; DX=0002h
; CF=0
; ZF=1
