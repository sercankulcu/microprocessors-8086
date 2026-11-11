; Etiketler ve adlar: kod etiketi (basla:, don:) bir komutun adresidir, iki nokta ile
; biter; değişken adı (sayi) iki noktasız yazılır, türü ve adresi birlikte saklanır.
; Döngü AX'i 3 kez artırır.
; Kaynak: Bölüm 3.2 Assembly, "Etiketler ve Adlar"

org 100h            ; sunumda yok: .COM programı
basla:  MOV CX, 3   ; kod etiketi
don:    INC AX
        LOOP don    ; don = adres
        RET
sayi    DB 7        ; veri adı

; YAZMACLAR: AX CX
; BELLEK: sayi 1

; Beklenen cikti (AX başlangıçta 0 sayılır):
; AX=0003h
; CX=0000h
; sayi: 07h
