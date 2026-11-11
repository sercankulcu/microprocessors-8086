; Bellege sabit yazma: boyutu BYTE PTR / WORD PTR belirler (65 = 41h = 'A').
; Sunum 4.1 Bellek Erisimi, slayt "Belleğe Sabit Yazma".
ORG 100h
MOV BYTE PTR [4000h], 65  ; 'A'
MOV WORD PTR [4002h], 65
RET
ORG 4000h      ; sunumda yok: izlemedeki onceki bellek icerigi (00 99 00 99)
alan DB 00h, 99h, 00h, 99h   ; sunumda yok

; BELLEK: alan 4

; Beklenen cikti:
; alan: 41h 99h 41h 00h
