; ES ile video bellegine yazma: B800:00A0h'ye sari 'K' (1Eh); ayni bagil konum DS'de baska bayt.
; Sunum 4.1 Bellek Erisimi, slayt "Kesim Öneki: Kod İzleme".
; 'K' ekranda satir 1, sutun 0'da gorunur; AL ve DL iki kesimdeki baytlari gosterir.
ORG 100h
MOV AX, 0B800h
MOV ES, AX         ; ES = video
MOV BX, 00A0h      ; satır 1
MOV BYTE PTR ES:[BX], 'K'
MOV BYTE PTR ES:[BX+1], 1Eh
MOV AL, [BX]       ; DS:00A0h
MOV DL, ES:[BX]    ; B800:00A0h
RET

; YAZMACLAR: DS ES AL DL

; Beklenen cikti:
;
; K
; DS=0700h
; ES=B800h
; AL=00h
; DL=4Bh
