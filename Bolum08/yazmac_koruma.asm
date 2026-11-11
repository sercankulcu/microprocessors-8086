; Yazmaç koruma: yildiz prosedürü iç döngüsünde CX kullanır ama çağıranın sayacını
; PUSH CX / POP CX ile korur. 2 satır x 3 '#': ekranda 6 karakter.
; Sunum: Bölüm 8 Prosedürler, slayt "Yazmaç Koruma: Kod İzleme".
ORG  100h        ; sunumda yok: .COM programı
MOV  CX, 2       ; ana döngü: 2 satır
satir: CALL yildiz
LOOP satir
RET
yildiz PROC
PUSH CX          ; çağıranın sayacı
MOV  CX, 3       ; iç sayaç
MOV  AX, 0E23h   ; AH = 0Eh, AL = '#'
ic:  INT 10h
LOOP ic
POP  CX          ; sayaç geri
RET
yildiz ENDP

; YAZMACLAR: AX CX
; Beklenen cikti:
; ######
; AX=0E23h
; CX=0000h
