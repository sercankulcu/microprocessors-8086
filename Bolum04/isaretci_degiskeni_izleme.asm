; Bellekteki isaretci: ADD p, 2 isaretciyi ilerletir, her kullanimda once BX'e alinir.
; Sunum 4.2 Degiskenler, slayt "İşaretçi Değişkeni: Kod İzleme".
ORG 100h
MOV BX, p          ; p'nin içi
MOV AL, [BX]       ; dizi[0]
ADD p, 2           ; ilerlet
MOV BX, p
MOV AH, [BX]       ; dizi[2]
RET
dizi DB 'KAYA'
p    DW dizi       ; adres

; YAZMACLAR: AX BX
; BELLEK: p 2

; Beklenen cikti:
; AX=594Bh
; BX=0114h
; p: 14h 01h
