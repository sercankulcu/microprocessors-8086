; Adres mi, icerik mi: LEA AX, [BX+DI+2] etkin adresi (veri + 4), MOV AX, [BX+DI+2] oradaki
; sozcugu (3333h) verir (izlemede veri 0114h, EA 0118h). LES DI, ekran: DI = 0000h, ES = B800h; STOSB B8000h'ye 'A' yazar, DI = 1.
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "LEA ve LES: Kod İzleme"
; YAZMACLAR: AX BX DI ES
; BELLEK: veri 6

org 100h
lea bx, veri        ; BX ← adres
mov di, 2
lea ax, [bx+di+2]   ; AX ← EA
mov ax, [bx+di+2]   ; AX ← [EA]
les di, dword ptr ekran ; uzak işaretçi  -- sunumda yok: DWORD PTR (UASM DW etiketle LES kabul etmiyor)
mov al, 'A'
stosb               ; ES:[DI] ← AL
ret
veri  dw 1111h, 2222h, 3333h
ekran dw 0000h, 0B800h

; Beklenen cikti:
; A
; AX=3341h
; BX=0114h
; DI=0001h
; ES=B800h
; veri: 11h 11h 22h 22h 33h 33h
