; if / else ve while kalıbının assembly karşılığı: koşulun TERSİ ile atlanır.
; if (AX == BX) DX = 1; else DX = 2;  while (CX > 0) { DX += CX; CX--; }  ->  DX = 5.
; Sunum: Bölüm 7 Akış Kontrolü, slaytlar "if / else Kalıbı" (genel kalıp) ve
; "if / else ve while: Kod İzleme" (bu program).
ORG  100h        ; sunumda yok: .COM programı
MOV  AX, 12
MOV  BX, 30
CMP  AX, BX
JNE  degil       ; koşulun TERSİ
MOV  DX, 1       ; A bloğu: AX = BX
JMP  son
degil: MOV DX, 2 ; B bloğu: AX ≠ BX
son: MOV CX, 2   ; while (CX > 0)
bas: CMP CX, 0
JBE  bitti       ; CX ≤ 0 → çık
ADD  DX, CX      ; gövde
DEC  CX
JMP  bas
bitti: RET

; YAZMACLAR: AX BX CX DX ZF
; Beklenen cikti:
; AX=000Ch
; BX=001Eh
; CX=0000h
; DX=0005h
; ZF=1
