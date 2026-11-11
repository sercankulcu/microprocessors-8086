; LAHF, SAHF ve CMC: FFh + 1 sonrası bayrakların düşük baytı AH'ye kopyalanır (57h);
; CMC, CLC, STC CF'yi değiştirir; SAHF ile AH = C1h bayraklara yazılır: SF = ZF = CF = 1.
; Kaynak: Bölüm 2.2 8086 Yazmaçları, "LAHF, SAHF ve CMC: Kod İzleme"

org 100h
mov al, 0FFh
add al, 1       ; CF ZF AF PF = 1
lahf            ; AH ← bayraklar
cmc             ; CF tersle
clc             ; CF = 0
stc             ; CF = 1
mov ah, 0C1h    ; 1100 0001b
sahf            ; bayraklar ← AH
ret

; YAZMACLAR: AX SF ZF AF PF CF

; Beklenen cikti:
; AX=C100h
; SF=1
; ZF=1
; AF=0
; PF=0
; CF=1
