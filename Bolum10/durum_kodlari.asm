; Her komutun urettigi yol dongusu turu (S2' S1' S0'): bellek oku, bellege yaz, G/C oku,
; G/C yaz, yigina yaz, dur. Port 60h 5Ah dondurur; sonunda AX = 125Ah, SP = FFFCh.
; Kaynak: Bolum 10.1 8086 Pinleri, "Durum Kodları: Kod İzleme"
; PORT 96: 5Ah
; YAZMACLAR: AX SP
; BELLEK: veri 4

org 100h
mov bx, 0200h
mov ax, [bx]      ; bellek oku
mov [bx+2], ax    ; belleğe yaz
in al, 60h        ; G/Ç oku
out 61h, al       ; G/Ç yaz
push ax           ; yığına yaz
hlt               ; dur
org 0200h          ; sunumda yok: izlemede DS:0200h = 1234h
veri dw 1234h, 0   ; sunumda yok

; Beklenen cikti:
; OUT 97 <- 5Ah
; AX=125Ah
; SP=FFFCh
; veri: 34h 12h 34h 12h
