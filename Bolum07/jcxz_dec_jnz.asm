; JCXZ, CX = 0 iken LOOP'lu döngüye girmeyi önler (yoksa gövde 65.536 kez çalışırdı).
; DEC-JNZ döngüsü istenen yazmacı (burada BX) sayaç yapabilir ve CF'yi korur.
; Sunum: Bölüm 7 Akış Kontrolü, slaytlar "JCXZ ve LOOP / DEC–JNZ" (genel kalıp) ve
; "JCXZ ve DEC–JNZ: Kod İzleme" (bu program).
ORG  100h        ; sunumda yok: .COM programı
MOV  CX, 0       ; n = 0
MOV  AX, 0
JCXZ atla        ; CX = 0 → girme
tekrar: INC AX
LOOP tekrar
atla: MOV BX, 3  ; n = 3, sayaç BX
STC              ; CF = 1
tekrar2: INC AX
DEC  BX          ; CF korunur
JNZ  tekrar2
RET

; YAZMACLAR: AX BX CX CF ZF
; Beklenen cikti:
; AX=0003h
; BX=0000h
; CX=0000h
; CF=1
; ZF=1
