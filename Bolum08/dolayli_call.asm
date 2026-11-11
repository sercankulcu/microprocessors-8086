; Dolaylı CALL: hedef adres bellekten (tablo[SI]) ya da yazmaçtan (BX) alınır.
; AX = 6 -> iki_kat -> 12 -> bir_ekle -> 13 = 000Dh.
; Sunum: Bölüm 8 Prosedürler, slayt "Dolaylı CALL: Kod İzleme".
ORG  100h        ; sunumda yok: .COM programı
MOV  AX, 6
MOV  SI, 2       ; 2. işlem (× 2)
CALL tablo[SI]   ; bellekle dolaylı
MOV  BX, OFFSET bir_ekle
CALL BX          ; yazmaçla dolaylı
RET
tablo DW bir_ekle, iki_kat
bir_ekle: INC AX
RET
iki_kat: SHL AX, 1
RET

; YAZMACLAR: AX BX SI
; BELLEK: tablo 4
; Beklenen cikti:
; AX=000Dh
; BX=0114h
; SI=0002h
; tablo: 14h 01h 16h 01h
