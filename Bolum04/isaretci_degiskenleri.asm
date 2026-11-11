; Isaretci degiskeni: p DW dizi bellekte bir adres tutar; MOV BX, p icerigi, LEA SI, p adresi
; verir. uzak DD dizi bagil konum ve kesimi birlikte tutar.
; Sunum 4.2 Degiskenler, slayt "İşaretçi Değişkenleri".
ORG 100h
MOV BX, p          ; 010Bh
LEA SI, p          ; 010Fh
MOV DI, OFFSET dizi
RET
dizi DB 'KAYA'     ; 010Bh
p    DW dizi       ; 010Fh, içi 010Bh
; uzak DD dizi     ; bağıl konum + kesim
uzak DW dizi, 0    ; sunumda yok: slayttaki 'uzak DD dizi' kesim kismi icin yeniden yerlestirme
                   ; ister; .COM ikili ciktisinda (UASM -bin) derlenmez. Kesim kismi burada 0.

; YAZMACLAR: BX SI DI
; BELLEK: p 2

; Beklenen cikti:
; BX=010Bh
; SI=010Fh
; DI=010Bh
; p: 0Bh 01h
