; Bellekten bellege MOV yoktur: her bayt AL uzerinden kopyalanir (LOOP ile 4 bayt).
; Sunum 4.1 Bellek Erisimi, slayt "Bellekten Belleğe Kopyalama: Kod İzleme".
org 100h
mov si, offset kaynak
mov di, offset hedef
mov cx, 4
kopya:
mov al, [si]         ; bellek → AL
mov [di], al         ; AL → bellek
inc si
inc di
loop kopya
ret
kaynak db 'ABCD'
hedef  db 4 dup('.')

; YAZMACLAR: SI DI CX AL
; BELLEK: hedef 4

; Beklenen cikti:
; SI=0116h
; DI=011Ah
; CX=0000h
; AL=44h
; hedef: 41h 42h 43h 44h
