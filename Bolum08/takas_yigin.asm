; Yığınla takas: PUSH AX, PUSH BX, POP AX, POP BX iki yazmacın değerini değiştirir.
; Sunum: Bölüm 8 Yığın, slaytlar "Örnek: Takas (Swap)" ve "Takas Yöntemleri" (1. yöntem).
ORG    100h
MOV    AX, 1212h  ; AX ← 1212h
MOV    BX, 3434h  ; BX ← 3434h
PUSH   AX         ; AX'i yığına koy
PUSH   BX         ; BX'i yığına koy
POP    AX         ; AX ← BX'in eski değeri
POP    BX         ; BX ← AX'in eski değeri
RET
END

; YAZMACLAR: AX BX
; Beklenen cikti:
; AX=3434h
; BX=1212h
