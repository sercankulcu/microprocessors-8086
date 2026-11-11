; Dizi: ardisik baytlar; tirnak icindeki metin ASCII kodlarina acilir (a ve b ayni baytlar).
; Sunum 4.2 Degiskenler, slayt "Diziler".
ORG 100h         ; sunumda yok
RET              ; sunumda yok
a DB 48h, 65h, 6Ch, 6Ch, 6Fh, 00h
b DB 'Hello', 0

; BELLEK: a 6
; BELLEK: b 6

; Beklenen cikti:
; a: 48h 65h 6Ch 6Ch 6Fh 00h
; b: 48h 65h 6Ch 6Ch 6Fh 00h
