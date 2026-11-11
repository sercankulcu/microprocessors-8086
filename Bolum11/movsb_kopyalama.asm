; MOVSB + LOOP ile 4 bayt kopyalama (= mov cx, 4 / rep movsb): her MOVSB [ES:DI] <- [DS:SI]
; yapar, DF = 0 oldugundan SI ve DI birer artar; sonunda hedef = 'ABCD'.
; Izlemede kaynak 010Eh, hedef 0112h; sonda SI = 0112h, DI = 0116h.
; Kaynak: Bolum 11 Komut Kodlama ve Dizgi Komutlari, "İz: MOVSB"
; YAZMACLAR: CX SI DI
; BELLEK: hedef 4

org 100h
cld
lea si, kaynak     ; DS:SI kaynak
lea di, hedef      ; ES:DI hedef
mov cx, 4
kopya:
movsb              ; [DI]←[SI], SI++, DI++
loop kopya         ; = rep movsb
ret
kaynak db 'ABCD'
hedef  db 4 dup('.')

; Beklenen cikti:
; CX=0000h
; SI=0112h
; DI=0116h
; hedef: 41h 42h 43h 44h
