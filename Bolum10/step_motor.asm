; Step motor (port 7): bit 7 = 1 (hazir) olana kadar yoklar, sonra tablodaki miknatis baytini
; yazar. 4 bayt bir tur; 20h tur sonra sonraki tabloya gecer (CW yari -> CCW yari -> CW tam
; -> CCW tam -> basa). Port 7 once 00h (mesgul), sonra hep 80h (hazir) dondurur.
; SINIR ilk turu (110b, 100b, 011b, 010b) ve tur sayacinin 1 olusunu gosterir.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Step Motor Programı" (iki slayt) ve "Step Motor İzleme"
; PORT 7: 00h 80h
; SINIR: 43
; YAZMACLAR: BX CX SI

option nokeyword:<wait>   ; sunumda yok: UASM'de WAIT komut adi, etiket olamaz
ORG 100h
steps_before_direction_change = 20h
jmp start
datcw     db 110b,100b,011b,010b
datccw    db 011b,001b,110b,010b
datcw_fs  db 001b,011b,110b,000b
datccw_fs db 100b,110b,011b,000b
start:
mov bx, offset datcw
mov si, 0
mov cx, 0   ; tur sayacı
next_step:
wait: in al, 7
test al, 10000000b
jz wait
mov al, [bx][si]
out 7, al
inc si
cmp si, 4
jb next_step
mov si, 0
inc cx
cmp cx, steps_before_direction_change
jb  next_step
mov cx, 0
add bx, 4   ; sonraki tablo
cmp bx, offset datccw_fs
jbe next_step
mov bx, offset datcw
jmp next_step

; Beklenen cikti:
; OUT 7 <- 06h
; OUT 7 <- 04h
; OUT 7 <- 03h
; OUT 7 <- 02h
; BX=0102h
; CX=0001h
; SI=0000h
