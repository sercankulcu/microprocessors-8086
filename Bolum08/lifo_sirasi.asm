; Yığın LIFO çalışır: 1, 2, 3 itilir; POP'lar 3, 2, 1 sırasıyla geri verir.
; Sunum: Bölüm 8 Yığın, slayt "Örnek: LIFO Sırası".
ORG    100h       ; sunumda yok: .COM programı
MOV    AX, 1      ; AX'e 1 ata
PUSH   AX         ; 1'i yığına koy
MOV    AX, 2      ; AX'e 2 ata
PUSH   AX         ; 2'yi yığına koy
MOV    AX, 3      ; AX'e 3 ata
PUSH   AX         ; 3'ü yığına koy
POP    BX         ; BX ← 3
POP    BX         ; BX ← 2
POP    BX         ; BX ← 1
RET               ; sunumda yok: DOS'a dönüş

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=0003h
; BX=0001h
