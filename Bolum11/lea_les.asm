; LEA adresi, MOV icerigi verir: LEA AX, [BX+DI+2] -> AX = 0016h, MOV AX, [BX+DI+2] -> AX =
; [0016h]. LES DI, ekran uzak isaretciyi yukler (DI = 0000h, ES = B800h); STOSB ekranin sol
; ust kosesine 'A' yazar (B8000h); ekranda 'A' gorunur, ES:DI de denetlenir.
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "LEA, LDS, LES"
; YAZMACLAR: BX DI ES

ORG 100h           ; sunumda yok
mov bx, 0010h
mov di, 0004h
lea ax, [bx+di+2]  ; AX = 0016h
mov ax, [bx+di+2]  ; AX = [0016h]

; ekran belleği: B800:0000
; (ekran dw 0000h, 0B800h tanimi buradaydi; kodun ortasinda veri calistirilacagi icin sona alindi)
les di, dword ptr ekran ; DI=0000h ES=B800h  -- sunumda yok: DWORD PTR (UASM DW etiketle LES kabul etmiyor)
mov al, 'A'
stosb             ; köşeye 'A'
ret                ; sunumda yok
ekran dw 0000h, 0B800h

; Beklenen cikti:
; A
; BX=0010h
; DI=0001h
; ES=B800h
