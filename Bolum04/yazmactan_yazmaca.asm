; Yazmactan yazmaca adres kopyalama: DI = SI, ikisi ayni hucreyi gosterir.
; Sunum 4.1 Bellek Erisimi, slayt "Yazmaçtan Yazmaca".
ORG 100h       ; sunumda yok
MOV SI, 3000h  ; SI = adres
MOV DI, SI     ; DI = SI
MOV AL, [SI]   ; DS:3000h
MOV [DI+1], AL ; DS:3001h
RET            ; sunumda yok
ORG 3000h      ; sunumda yok: izlemedeki bellek icerigi (DS:3000h = 5Ah)
hucre DB 5Ah, 0   ; sunumda yok

; YAZMACLAR: SI DI AL
; BELLEK: hucre 2

; Beklenen cikti:
; SI=3000h
; DI=3000h
; AL=5Ah
; hucre: 5Ah 5Ah
