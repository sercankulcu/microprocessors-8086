; Termostat (port 125 sicaklik, port 127 isitici): sicaklik 60 C'nin altindaysa isitici
; acilir (1), 80 C'nin ustundeyse kapanir (0), aradaysa dokunulmaz. Isaretli karsilastirma
; (JL/JLE/JG). Port 125 sirayla 55, 70, 85 dondurur (sonra hep 85). Sonsuz dongu.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Termometre Programı"
; PORT 125: 55 70 85
; SINIR: 24
; YAZMACLAR: AL DS

option nokeyword:<low high>   ; sunumda yok: UASM'de LOW/HIGH islec adi, etiket olamaz
ORG 100h      ; sunumda yok
; DS'yi CS'ye eşitle:
mov ax, cs
mov ds, ax
start:
in  al, 125
cmp al, 60
jl  low
cmp al, 80
jle ok
jg  high
low:
mov al, 1
out 127, al   ; ısıtıcı açık
jmp ok
high:
mov al, 0
out 127, al   ; ısıtıcı kapalı
ok:
jmp start     ; sonsuz döngü

; Beklenen cikti:
; OUT 127 <- 01h
; OUT 127 <- 00h
; AL=00h
; DS=0700h
