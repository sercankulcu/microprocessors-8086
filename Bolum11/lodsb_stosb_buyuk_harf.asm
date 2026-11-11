; LODSB + STOSB ile dizgiyi yerinde buyuk harfe cevirme: AND AL, 0DFh bit 5'i temizler.
; 'mikro' -> 'MIKRO'. .COM programinda ES = DS oldugundan ES:DI ayni dizgiyi gosterir.
; Izlemede metin 0110h; sonda SI = DI = 0115h.
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "İz: LODSB / STOSB"
; YAZMACLAR: CX SI DI
; BELLEK: metin 5

org 100h
cld               ; DF = 0: ileri
lea si, metin
mov di, si        ; aynı yere yaz
mov cx, 5
don:
lodsb             ; AL = [SI], SI++
and al, 0DFh      ; büyük harf
stosb             ; [DI] = AL, DI++
loop don
ret
metin db 'mikro'

; Beklenen cikti:
; CX=0000h
; SI=0115h
; DI=0115h
; metin: 4Dh 49h 4Bh 52h 4Fh
