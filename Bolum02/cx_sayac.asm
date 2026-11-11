; CX sayaç: LOOP önce CX'i 1 azaltır, CX ≠ 0 ise atlar; gövde 5 kez çalışır.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "CX — Sayaç (Counter)"

org 100h        ; sunumda yok: .COM programı
MOV CX, 0005h   ; 5 tur
DONGU:
  ; ... gövde ...
  LOOP DONGU     ; CX--, CX≠0 ise atla
RET             ; sunumda yok: DOS'a dön

; YAZMACLAR: CX

; Beklenen cikti:
; CX=0000h
