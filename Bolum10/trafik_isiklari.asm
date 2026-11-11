; Trafik isiklari (port 4): once butun yonler kirmizi (all_red = 0249h), sonra durum tablosu
; situation -> s1 -> s2 -> s3 -> s4 -> situation ... 5 saniye arayla (INT 15h/86h) port 4'e
; yazilir. Sonsuz dongu: SINIR: ilk tur ve yeniden baslangictaki ilk OUT.
; Izlemede tablo 0124h'de, sit_end = 012Eh.
; Kaynak: Bolum 10.2 Aygit Kontrolu, "Trafik Programı", "Durum Tablosu", "INT 15h ile Bekleme"
; SINIR: 52
; YAZMACLAR: AX SI

#start=Traffic_Lights.exe#
ORG 100h         ; sunumda yok
mov ax, all_red
out 4, ax
mov si, offset situation
next:
mov ax, [si]
out 4, ax
mov cx, 4Ch      ; 5 s bekle
mov dx, 4B40h
mov ah, 86h
int 15h
add si, 2        ; sonraki durum
cmp si, sit_end
jb  next
mov si, offset situation
jmp next

;                 FEDC_BA98_7654_3210
situation     dw  0000_0011_0000_1100b
s1            dw  0000_0110_1001_1010b
s2            dw  0000_1000_0110_0001b
s3            dw  0000_1000_0110_0001b
s4            dw  0000_0100_1101_0011b
sit_end = $
all_red       equ 0000_0010_0100_1001b

; Beklenen cikti:
; OUT 4 <- 0249h
; OUT 4 <- 030Ch
; OUT 4 <- 069Ah
; OUT 4 <- 0861h
; OUT 4 <- 0861h
; OUT 4 <- 04D3h
; OUT 4 <- 030Ch
; AX=030Ch
; SI=0124h
