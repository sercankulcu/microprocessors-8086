; LEA adresi, MOV icerigi verir: LEA AX, [BX+DI+2] -> AX = 0016h, MOV AX, [BX+DI+2] -> AX =
; [0016h]. LES DI, ekran uzak isaretciyi yukler (DI = 0000h, ES = B800h); STOSB ekranin sol
; ust kosesine 'A' yazar (B8000h). LDS SI, ekran ayni isaretciyi DS:SI'ye yukler (SI = 0000h,
; DS = B800h); LODSB kosedeki 'A'yi geri okur: AL = 41h, SI = 0001h. Ekranda 'A' gorunur.
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "LEA, LDS, LES"
; YAZMACLAR: AL BX DI ES SI DS

ORG 100h           ; sunumda yok
mov bx, 0010h
mov di, 0004h
lea ax, [bx+di+2]  ; AX = 0016h
mov ax, [bx+di+2]  ; AX = [0016h]

; ekran belleği: B800:0000
; sunumda yok: DWORD PTR (UASM DW etiketle LES/LDS kabul etmiyor); slaytta "les di, ekran"
les di, dword ptr ekran ; DI=0000h ES=B800h
mov al, 'A'
stosb             ; köşeye 'A'
; sunumda yok: DWORD PTR (UASM DW etiketle LES/LDS kabul etmiyor); slaytta "lds si, ekran"
lds si, dword ptr ekran ; SI=0000h DS=B800h
lodsb             ; AL = köşedeki 'A'
ret
ekran dw 0000h, 0B800h

; Beklenen cikti:
; A
; AL=41h
; BX=0010h
; DI=0001h
; ES=B800h
; SI=0001h
; DS=B800h
