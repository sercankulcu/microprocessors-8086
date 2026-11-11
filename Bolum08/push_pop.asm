; PUSH AX / POP BX: değer AX'ten BX'e yığın üzerinden kopyalanır (42 = 002Ah).
; Sunum: Bölüm 8 Yığın, slayt "Örnek: PUSH AX / POP BX".
ORG    100h
MOV    AX, 42     ; AX'e 42 ata
PUSH   AX         ; AX'i yığına koy
POP    BX         ; yığından BX'e al
RET               ; işletim sistemine dön
END

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=002Ah
; BX=002Ah
