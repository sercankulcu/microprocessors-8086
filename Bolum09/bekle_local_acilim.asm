; LOCAL ilk iceren BEKLE makrosunun iki acilimi: etiketler ??0000 ve ??0001 adini aldi,
; JNZ her kopyada kendi etiketine doner. Toplam 3 + 2 = 5 DEC calisir.
; Sunum 9.1 "BEKLE ve LOCAL: Kod Izleme".
org 100h
mov cx, 3
??0000: dec cx   ; BEKLE (1. kopya)
jnz ??0000
mov cx, 2
??0001: dec cx   ; BEKLE (2. kopya)
jnz ??0001
ret

; YAZMACLAR: CX ZF
; Beklenen cikti:
; CX=0000h
; ZF=1
