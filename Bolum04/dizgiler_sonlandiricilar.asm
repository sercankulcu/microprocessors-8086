; Dizgi bicimleri: 0 ile biten, '$' ile biten, CR LF'li, uzunluk onekli, cift tirnakli.
; Sunum 4.2 Degiskenler, slayt "Dizgiler ve Sonlandırıcılar".
ORG 100h                       ; sunumda yok
RET                            ; sunumda yok
s1 DB 'Merhaba', 0             ; sıfırla biten dizgi
s2 DB 'Merhaba$'               ; '$' ile biten (INT 21h / AH = 09h)
s3 DB 13, 10, 'Satir', 13, 10, '$' ; CR LF: satır başı + yeni satır
s4 DB 7, 'Merhaba'             ; uzunluk önekli: ilk bayt = 7
s5 DB "Ali'nin", 0             ; çift tırnak içinde tek tırnak

; BELLEK: s1 8
; BELLEK: s2 8
; BELLEK: s3 10
; BELLEK: s4 8
; BELLEK: s5 8

; Beklenen cikti:
; s1: 4Dh 65h 72h 68h 61h 62h 61h 00h
; s2: 4Dh 65h 72h 68h 61h 62h 61h 24h
; s3: 0Dh 0Ah 53h 61h 74h 69h 72h 0Dh 0Ah 24h
; s4: 07h 4Dh 65h 72h 68h 61h 62h 61h
; s5: 41h 6Ch 69h 27h 6Eh 69h 6Eh 00h
